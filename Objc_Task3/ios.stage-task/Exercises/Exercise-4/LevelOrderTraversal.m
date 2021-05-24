#import "LevelOrderTraversal.h"

NSUInteger LevelOrderTraversalForTreeNodes(NSArray *tree, NSMutableArray<NSMutableArray *> *array, NSUInteger level, NSUInteger startIndex) {
    
    typedef enum {
        Left,
        Right
    } NodeType;
    
    NSUInteger i = startIndex;
    for (NodeType nodeType = Left; nodeType <= Right && i < tree.count; ++nodeType) {
        NSObject *node = tree[i++];
        if ([node isKindOfClass:NSNumber.class]) {
            if (array.count <= level) {
                [array addObject:[NSMutableArray new]];
            }
            [array[level] addObject:node];
            
            i = LevelOrderTraversalForTreeNodes(tree, array, level+1, i);
        }
    }
    return i;
}

NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    NSMutableArray<NSMutableArray *> *array = [NSMutableArray new];
    
    NSUInteger level = 0;
    LevelOrderTraversalForTreeNodes(tree, array, level, 0);
    return [array copy];
}
