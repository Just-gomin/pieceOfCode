import crypto from "crypto";

interface BlockInterface {
  prevHash: string;
  height: number;
  data: string;
  hash: string;
}

class Block implements BlockInterface {
  hash: string;
  constructor(
    public prevHash: string,
    public height: number,
    public data: string
  ) {
    this.hash = Block.calculateHash(prevHash, height, data);
  }

  static calculateHash(prevHash: string, height: number, data: string): string {
    const toHash = `${prevHash}${height}${data}`;
    return crypto.createHash("sha256").update(toHash).digest("hex");
  }
}
