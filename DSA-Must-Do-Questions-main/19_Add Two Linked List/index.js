let l1 = [2, 4, 3];
let l2 = [5, 6, 4];

addTwoInLinkedList(l1, l2);
function addTwoInLinkedList(l1, l2) {
    let c = 0;
    let node = new ListNode(0);
    let ans = node;

    while (l1 || l2 || c) {
        let sum = (l1 ? l1.val : 0) + (l2 ? l2.val : 0) + c;
        c = Math.floor(sum / 10);
        sum = sum % 10;
        ans.next = new ListNode(sum);

        if (l1) {
            l1 = l1.next;
        }
        if (l2) {
            l2 = l2.next;
        }
        ans = ans.next;
    }
    return node.next
}