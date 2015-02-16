!#/bin/enb ruby
require_relative 'bst'
require_relative '../misc/queue'
#
#pre-order used to clone a tree
#in-order used to itereate a bst in order
#post-oder used to delete a tree representing a memory reference hierachy
class TreeTraversal

    class << self

    def pre_order t
        pre_order_2 t.root
    end

    def pre_order_2 n
        return if n.nil? 
        visit n
        pre_order_2 n.left
        pre_order_2 n.right
    end


    def in_order t
        in_order_2 t.root
    end

    def in_order_2 n
        return if n.nil?
        in_order_2 n.left
        visit n
        in_order_2 n.right
    end

    #iterative version of traversal
    def pre_order_i t
        return if t.nil? || t.root.nil?
        stack = [t.root]
        while (!stack.empty?) do 
            n = stack.pop
            visit(n)
            # push right first!
            stack.push(n.right) if n.right != nil
            stack.push(n.left)  if n.left !=nil
        end
    end


    # todo
    def in_order_i t
    
    end

    #or level_order traversal
    def bfs t
        q = Queue.new(100)
        q.enqueue(t.root)
        while(!q.empty?) do 
            n = q.dequeue
            visit(n)
            q.enqueue(n.left)  if n.left != nil
            q.enqueue(n.right) if n.right != nil
        end
    end

    def visit n
        puts "#{n.k}"
    end

    end # self

end

#---------------------------- 
#-------------------
t = BST.new
v = [22,17,24,12,8,45,16]
v.each do |e|
    t.put(e,"#{e}")
end
#-----------------------
#TreeTraversal.pre_order t
#TreeTraversal.pre_order_i t
TreeTraversal.in_order t
TreeTraversal.bfs t
