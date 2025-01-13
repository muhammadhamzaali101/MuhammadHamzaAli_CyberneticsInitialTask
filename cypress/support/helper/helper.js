// Assert that Actual value is equal to expected
export function assertEqual(actual, expected) {
    expect(actual).to.equal(expected);
}

// Assert that Actual value contains expected
export function assertContains(actual, expected) {
    expect(actual).to.contain(expected);
}

// Assert that Actual value exists
export function assertExists(actual) {
    expect(actual).to.exist;
}

// Assert that Actual value is empty
export function assertEmpty(actual) {
    expect(actual).to.be.empty;
}

// Assert that Actual value is not empty
export function assertNotEmpty(actual) {
    expect(actual).to.not.be.empty;
}

// Assert that Actual value is greater than expected
export function assertGreaterThan(actual, expected) {
    expect(actual).to.be.greaterThan(expected);
}

// Assert that Actual value is less than expected
export function assertLessThan(actual, expected) {
    expect(actual).to.be.lessThan(expected);
}
// Assert that Actual value is deeply equal to expected
export function assertDeepEqual(actual, expected) {
    expect(actual).to.deep.equal(expected);
}
// Assert that Actual value includes a specific key (for objects)
export function assertHasKey(actual, key) {
    expect(actual).to.have.property(key);
}

// Assert that Actual array includes a specific element
export function assertIncludes(actual, element) {
    expect(actual).to.include(element);
}
