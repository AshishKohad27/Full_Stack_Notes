function reverseLinkedList(head) {
    let current = head;
    let previous = null;
    let forward = null;

    while (current !== null) {
        forward = current.next;
        current = previous;
        previous = current;
        current = forward;
    }
    head = previous
    // return head;
    console.log(head)
}