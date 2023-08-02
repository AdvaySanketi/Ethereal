import fastapi
import comp_blockchain
blockchain=comp_blockchain.Blockchain1()
app=fastapi.FastAPI()

@app.post("/create block/")
def mine_bloc(data):
    if not blockchain.chain_valid():
        return fastapi.HTTPException(status_code=400,detail="Blockchain not valid")
    block=blockchain.mine_block(data)
    return block

@app.get("/Get blockchain/")
def get_blockchain():
    if not blockchain.chain_valid():
        return fastapi.HTTPException(status_code=400,detail="Blockchain not valid")
    chain=blockchain.chain
    return chain

@app.get("/previous block/")
def previ_block():
    if not blockchain.chain_valid():
        return fastapi.HTTPException(status_code=400,detail="Blockchain not valid")
    pblock=blockchain.previous_block()
    return pblock

@app.get("/validity/")
def ch_valid():
    if not blockchain.chain_valid():
        return fastapi.HTTPException(status_code=400,detail="Blockchain not valid")
    return blockchain.chain_valid()