#!/usr/bin/env node
/**
 * json-strip.mjs
 * Usage: node json-strip.mjs <input.json> <key1> [key2 ...]
 *
 * Reads a JSON array from <input.json>, removes the specified keys from every
 * object, and streams the result to <input-stripped.json> (same directory,
 * same base name with a "-stripped" suffix).
 */

import { createReadStream, createWriteStream } from 'fs';
import { stat } from 'fs/promises';
import { basename, dirname, extname, join } from 'path';

const [,, inputPath, ...keysToRemove] = process.argv;

if (!inputPath || keysToRemove.length === 0) {
  console.error('Usage: node strip-keys.mjs <input.json> <key1> [key2 ...]');
  process.exit(1);
}

await stat(inputPath).catch(() => {
  console.error(`File not found: ${inputPath}`);
  process.exit(1);
});

const dir = dirname(inputPath);
const ext = extname(inputPath);
const base = basename(inputPath, ext);
const outputPath = join(dir, `${base}-stripped${ext}`);

const keySet = new Set(keysToRemove);

// Read full file then stream output (JSON.parse needs the full payload)
const chunks = [];
const rs = createReadStream(inputPath, { encoding: 'utf8' });
for await (const chunk of rs) chunks.push(chunk);

let data;
try {
  data = JSON.parse(chunks.join(''));
} catch (err) {
  console.error(`Failed to parse JSON: ${err.message}`);
  process.exit(1);
}

if (!Array.isArray(data)) {
  console.error('Input JSON must be an array at the top level.');
  process.exit(1);
}

const ws = createWriteStream(outputPath, { encoding: 'utf8' });

ws.write('[\n');
for (let i = 0; i < data.length; i++) {
  const item = typeof data[i] === 'object' && data[i] !== null ? data[i] : data[i];
  if (typeof item === 'object' && item !== null) {
    for (const key of keySet) delete item[key];
  }
  const comma = i < data.length - 1 ? ',' : '';
  ws.write(`  ${JSON.stringify(item)}${comma}\n`);
}
ws.write(']\n');

await new Promise((resolve, reject) => {
  ws.end();
  ws.on('finish', resolve);
  ws.on('error', reject);
});

console.log(`Done. Removed keys: [${[...keySet].join(', ')}]`);
console.log(`Output: ${outputPath}`);
