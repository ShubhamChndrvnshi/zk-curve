%builtins output

from starkware.cairo.common.serialize import serialize_word

func suma_dos_nums(num1: felt, num2: felt) -> (felt,) {
    alloc_locals;
    local sum = num1 + num2;
    return (sum,);
}

func main{output_ptr: felt*}() {
    alloc_locals;

    const NUM1 = 1;
    const NUM2 = 10;

    let (sum) = suma_dos_nums(num1=NUM1, num2=NUM2);
    serialize_word(sum);
    return ();
}
