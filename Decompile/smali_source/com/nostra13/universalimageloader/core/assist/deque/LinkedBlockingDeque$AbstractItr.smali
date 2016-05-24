.class abstract Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$AbstractItr;
.super Ljava/lang/Object;
.source "LinkedBlockingDeque.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "AbstractItr"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<TE;>;"
    }
.end annotation


# instance fields
.field private lastRet:Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node",
            "<TE;>;"
        }
    .end annotation
.end field

.field next:Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node",
            "<TE;>;"
        }
    .end annotation
.end field

.field nextItem:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TE;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque;


# direct methods
.method constructor <init>(Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque;)V
    .registers 4

    .prologue
    .line 1036
    .local p0, "this":Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$AbstractItr;, "Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque<TE;>.AbstractItr;"
    iput-object p1, p0, Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$AbstractItr;->this$0:Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1038
    iget-object v0, p1, Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 1039
    .local v0, "lock":Ljava/util/concurrent/locks/ReentrantLock;
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 1041
    :try_start_a
    invoke-virtual {p0}, Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$AbstractItr;->firstNode()Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;

    move-result-object v1

    iput-object v1, p0, Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$AbstractItr;->next:Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;

    .line 1042
    iget-object v1, p0, Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$AbstractItr;->next:Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;

    if-nez v1, :cond_1b

    const/4 v1, 0x0

    :goto_15
    iput-object v1, p0, Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$AbstractItr;->nextItem:Ljava/lang/Object;
    :try_end_17
    .catchall {:try_start_a .. :try_end_17} :catchall_20

    .line 1044
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 1046
    return-void

    .line 1042
    :cond_1b
    :try_start_1b
    iget-object v1, p0, Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$AbstractItr;->next:Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;

    iget-object v1, v1, Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;->item:Ljava/lang/Object;
    :try_end_1f
    .catchall {:try_start_1b .. :try_end_1f} :catchall_20

    goto :goto_15

    .line 1044
    :catchall_20
    move-exception v1

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v1
.end method

.method private succ(Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;)Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node",
            "<TE;>;)",
            "Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node",
            "<TE;>;"
        }
    .end annotation

    .prologue
    .line 1056
    .local p0, "this":Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$AbstractItr;, "Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque<TE;>.AbstractItr;"
    .local p1, "n":Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;, "Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node<TE;>;"
    :goto_0
    invoke-virtual {p0, p1}, Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$AbstractItr;->nextNode(Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;)Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;

    move-result-object v0

    .line 1057
    .local v0, "s":Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;, "Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node<TE;>;"
    if-nez v0, :cond_8

    .line 1058
    const/4 v0, 0x0

    .line 1062
    .end local v0    # "s":Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;, "Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node<TE;>;"
    :cond_7
    :goto_7
    return-object v0

    .line 1059
    .restart local v0    # "s":Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;, "Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node<TE;>;"
    :cond_8
    iget-object v1, v0, Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;->item:Ljava/lang/Object;

    if-nez v1, :cond_7

    .line 1061
    if-ne v0, p1, :cond_13

    .line 1062
    invoke-virtual {p0}, Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$AbstractItr;->firstNode()Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;

    move-result-object v0

    goto :goto_7

    .line 1064
    :cond_13
    move-object p1, v0

    .line 1065
    goto :goto_0
.end method


# virtual methods
.method advance()V
    .registers 3

    .prologue
    .line 1072
    .local p0, "this":Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$AbstractItr;, "Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque<TE;>.AbstractItr;"
    iget-object v1, p0, Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$AbstractItr;->this$0:Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque;

    iget-object v0, v1, Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 1073
    .local v0, "lock":Ljava/util/concurrent/locks/ReentrantLock;
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 1076
    :try_start_7
    iget-object v1, p0, Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$AbstractItr;->next:Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;

    invoke-direct {p0, v1}, Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$AbstractItr;->succ(Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;)Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;

    move-result-object v1

    iput-object v1, p0, Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$AbstractItr;->next:Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;

    .line 1077
    iget-object v1, p0, Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$AbstractItr;->next:Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;

    if-nez v1, :cond_1a

    const/4 v1, 0x0

    :goto_14
    iput-object v1, p0, Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$AbstractItr;->nextItem:Ljava/lang/Object;
    :try_end_16
    .catchall {:try_start_7 .. :try_end_16} :catchall_1f

    .line 1079
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 1081
    return-void

    .line 1077
    :cond_1a
    :try_start_1a
    iget-object v1, p0, Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$AbstractItr;->next:Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;

    iget-object v1, v1, Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;->item:Ljava/lang/Object;
    :try_end_1e
    .catchall {:try_start_1a .. :try_end_1e} :catchall_1f

    goto :goto_14

    .line 1079
    :catchall_1f
    move-exception v1

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v1
.end method

.method abstract firstNode()Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node",
            "<TE;>;"
        }
    .end annotation
.end method

.method public hasNext()Z
    .registers 2

    .prologue
    .line 1084
    .local p0, "this":Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$AbstractItr;, "Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque<TE;>.AbstractItr;"
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$AbstractItr;->next:Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public next()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 1088
    .local p0, "this":Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$AbstractItr;, "Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque<TE;>.AbstractItr;"
    iget-object v1, p0, Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$AbstractItr;->next:Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;

    if-nez v1, :cond_a

    .line 1089
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    throw v1

    .line 1090
    :cond_a
    iget-object v1, p0, Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$AbstractItr;->next:Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;

    iput-object v1, p0, Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$AbstractItr;->lastRet:Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;

    .line 1091
    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$AbstractItr;->nextItem:Ljava/lang/Object;

    .line 1092
    .local v0, "x":Ljava/lang/Object;, "TE;"
    invoke-virtual {p0}, Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$AbstractItr;->advance()V

    .line 1093
    return-object v0
.end method

.method abstract nextNode(Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;)Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node",
            "<TE;>;)",
            "Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node",
            "<TE;>;"
        }
    .end annotation
.end method

.method public remove()V
    .registers 4

    .prologue
    .line 1097
    .local p0, "this":Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$AbstractItr;, "Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque<TE;>.AbstractItr;"
    iget-object v1, p0, Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$AbstractItr;->lastRet:Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;

    .line 1098
    .local v1, "n":Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;, "Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node<TE;>;"
    if-nez v1, :cond_a

    .line 1099
    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2}, Ljava/lang/IllegalStateException;-><init>()V

    throw v2

    .line 1100
    :cond_a
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$AbstractItr;->lastRet:Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;

    .line 1101
    iget-object v2, p0, Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$AbstractItr;->this$0:Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque;

    iget-object v0, v2, Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 1102
    .local v0, "lock":Ljava/util/concurrent/locks/ReentrantLock;
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 1104
    :try_start_14
    iget-object v2, v1, Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;->item:Ljava/lang/Object;

    if-eqz v2, :cond_1d

    .line 1105
    iget-object v2, p0, Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$AbstractItr;->this$0:Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque;

    invoke-virtual {v2, v1}, Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque;->unlink(Lcom/nostra13/universalimageloader/core/assist/deque/LinkedBlockingDeque$Node;)V
    :try_end_1d
    .catchall {:try_start_14 .. :try_end_1d} :catchall_21

    .line 1107
    :cond_1d
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 1109
    return-void

    .line 1107
    :catchall_21
    move-exception v2

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v2
.end method
