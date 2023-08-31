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

class BlockChain {
  private blocks: Block[];
  constructor() {
    this.blocks = [];
  }

  private getPrevHash() {
    return this.blocks.length === 0
      ? ""
      : this.blocks[this.blocks.length - 1].hash;
  }

  public addBlock(data: string) {
    const newBlock = new Block(this.getPrevHash(), this.blocks.length, data);
    this.blocks.push(newBlock);
  }

  public getBlocks() {
    //   return this.blocks;
    return [...this.blocks]; // 임의로 외부에서 조작하는 것을 막기위해 새로운 배열을 반환
  }
}

const blockChain = new BlockChain();

blockChain.addBlock("1");
blockChain.addBlock("2");
blockChain.addBlock("3");

let blocks = blockChain.getBlocks();
blocks.push(new Block(blocks[blocks.length - 1].hash, blocks.length, "4"));

console.log(blockChain.getBlocks());
console.log(blocks);
