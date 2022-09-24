%lang starknet

%builtins pedersen range_check ecdsa

from starkware.cairo.common.cairo_builtins import HashBuiltin, SignatureBuiltin
from starkware.cairo.common.hash import hash2
from starkware.cairo.common.math import assert_not_zero
from starkware.cairo.common.math_cmp import is_le
from starkware.cairo.common.signature import verify_ecdsa_signature

@storage_var
func poll_owner_public_key(poll_id: felt) -> (answer: felt) {
}

@storage_var
func registered_voters(poll_id: felt, voter_public_key: felt) -> (is_registered: felt) {
}

@external
func init_poll{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    poll_id: felt, public_key: felt
) {
    let (is_poll_taken) = poll_owner_public_key.read(poll_id = poll_id);

    assert is_poll_taken = 0;

    poll_owner_public_key.write(poll_id = poll_id, value = public_key);
    return();
}

@external
func register_voter{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*,
        ecdsa_ptr : SignatureBuiltin*, range_check_ptr}(
    poll_id: felt, public_key: felt, r: felt, s: felt
) {

    let (cur_poll_owner) = poll_owner_public_key.read(poll_id = poll_id);

    // Verify the validity of the signature.
    let (message) = hash2{hash_ptr=pedersen_ptr}(x=poll_id, y=public_key);
    verify_ecdsa_signature(message=message, public_key=public_key, signature_r=r, signature_s=s);

    assert_not_zero(cur_poll_owner);

    registered_voters.write(poll_id = poll_id, voter_public_key = public_key, value = 1);
    return();
}