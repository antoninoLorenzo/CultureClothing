/**
 * Given productData and an input size returns the position in the array
 * */
function findBySize(product, selectedSize) {
    const matching = [];

    for (let i = 0; i < product.length; i++) {
        if (product[i].size === selectedSize) {
            matching.push(i);
        }
    }

    return matching;
}