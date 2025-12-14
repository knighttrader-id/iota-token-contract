module love_token::love {
    use iota::coin;
    use iota::url;

    public struct LOVE has drop {}

    fun init(witness: LOVE, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(
            witness, 
            6,
            b"LOVE", 
            b"Love Coin",  // Add name
            b"A love coin",  // Add description
            option::some(url::new_unsafe_from_bytes(b"https://cdn-icons-png.flaticon.com/256/4289/4289418.png")),
            ctx
        );
        
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx));
    }

    public fun mint(
        treasury: &mut coin::TreasuryCap<LOVE>,
        amount: u64, 
        recipient: address, 
        ctx: &mut TxContext
    ) {
        let minted_coins = coin::mint(treasury, amount, ctx);
        transfer::public_transfer(minted_coins, recipient);
    }

    public fun burn(
        treasury: &mut coin::TreasuryCap<LOVE>, 
        coins: coin::Coin<LOVE>
    ) {
        coin::burn(treasury, coins);
    }
}