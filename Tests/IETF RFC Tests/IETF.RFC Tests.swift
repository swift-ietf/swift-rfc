import IETF_RFC
import Testing

extension IETF.RFC {
    @Suite
    struct Namespace {
        @Test
        func exists() {
            #expect(IETF.RFC.self == IETF.RFC.self)
        }
    }
}
