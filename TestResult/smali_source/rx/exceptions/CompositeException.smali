.class public final Lrx/exceptions/CompositeException;
.super Ljava/lang/RuntimeException;
.source "CompositeException.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/exceptions/CompositeException$1;,
        Lrx/exceptions/CompositeException$CompositeExceptionCausalChain;,
        Lrx/exceptions/CompositeException$WrappedPrintWriter;,
        Lrx/exceptions/CompositeException$WrappedPrintStream;,
        Lrx/exceptions/CompositeException$PrintStreamOrWriter;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x29ffcc6947b49592L


# instance fields
.field private cause:Ljava/lang/Throwable;

.field private final exceptions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field private final message:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/Collection;)V
    .registers 9
    .param p1, "messagePrefix"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<+",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 49
    .local p2, "errors":Ljava/util/Collection;, "Ljava/util/Collection<+Ljava/lang/Throwable;>;"
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 83
    const/4 v4, 0x0

    iput-object v4, p0, Lrx/exceptions/CompositeException;->cause:Ljava/lang/Throwable;

    .line 50
    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    .line 51
    .local v1, "deDupedExceptions":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Throwable;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 52
    .local v0, "_exceptions":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_14
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_32

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Throwable;

    .line 53
    .local v2, "ex":Ljava/lang/Throwable;
    instance-of v4, v2, Lrx/exceptions/CompositeException;

    if-eqz v4, :cond_2e

    .line 54
    check-cast v2, Lrx/exceptions/CompositeException;

    .end local v2    # "ex":Ljava/lang/Throwable;
    invoke-virtual {v2}, Lrx/exceptions/CompositeException;->getExceptions()Ljava/util/List;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto :goto_14

    .line 56
    .restart local v2    # "ex":Ljava/lang/Throwable;
    :cond_2e
    invoke-interface {v1, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_14

    .line 60
    .end local v2    # "ex":Ljava/lang/Throwable;
    :cond_32
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 61
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    iput-object v4, p0, Lrx/exceptions/CompositeException;->exceptions:Ljava/util/List;

    .line 62
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lrx/exceptions/CompositeException;->exceptions:Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " exceptions occurred. "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lrx/exceptions/CompositeException;->message:Ljava/lang/String;

    .line 63
    return-void
.end method

.method public constructor <init>(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<+",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 66
    .local p1, "errors":Ljava/util/Collection;, "Ljava/util/Collection<+Ljava/lang/Throwable;>;"
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lrx/exceptions/CompositeException;-><init>(Ljava/lang/String;Ljava/util/Collection;)V

    .line 67
    return-void
.end method

.method private appendStackTrace(Ljava/lang/StringBuilder;Ljava/lang/Throwable;Ljava/lang/String;)V
    .registers 10
    .param p1, "bldr"    # Ljava/lang/StringBuilder;
    .param p2, "ex"    # Ljava/lang/Throwable;
    .param p3, "prefix"    # Ljava/lang/String;

    .prologue
    .line 176
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    invoke-virtual {p2}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/StackTraceElement;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_13
    if-ge v1, v2, :cond_29

    aget-object v3, v0, v1

    .line 178
    .local v3, "stackElement":Ljava/lang/StackTraceElement;
    const-string v4, "\t\tat "

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    add-int/lit8 v1, v1, 0x1

    goto :goto_13

    .line 180
    .end local v3    # "stackElement":Ljava/lang/StackTraceElement;
    :cond_29
    invoke-virtual {p2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    if-eqz v4, :cond_3d

    .line 181
    const-string v4, "\tCaused by: "

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    invoke-virtual {p2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    const-string v5, ""

    invoke-direct {p0, p1, v4, v5}, Lrx/exceptions/CompositeException;->appendStackTrace(Ljava/lang/StringBuilder;Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 184
    :cond_3d
    return-void
.end method

.method private final getListOfCauses(Ljava/lang/Throwable;)Ljava/util/List;
    .registers 5
    .param p1, "ex"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Throwable;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .prologue
    .line 244
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 245
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-virtual {p1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    .line 246
    .local v1, "root":Ljava/lang/Throwable;
    if-nez v1, :cond_10

    .line 252
    :goto_b
    return-object v0

    .line 254
    :cond_c
    invoke-virtual {v1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    .line 250
    :cond_10
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 251
    invoke-virtual {v1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-nez v2, :cond_c

    goto :goto_b
.end method

.method private printStackTrace(Lrx/exceptions/CompositeException$PrintStreamOrWriter;)V
    .registers 11
    .param p1, "s"    # Lrx/exceptions/CompositeException$PrintStreamOrWriter;

    .prologue
    .line 159
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 160
    .local v1, "bldr":Ljava/lang/StringBuilder;
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\n"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    invoke-virtual {p0}, Lrx/exceptions/CompositeException;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/StackTraceElement;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_14
    if-ge v4, v5, :cond_2a

    aget-object v6, v0, v4

    .line 162
    .local v6, "myStackElement":Ljava/lang/StackTraceElement;
    const-string v7, "\tat "

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\n"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    add-int/lit8 v4, v4, 0x1

    goto :goto_14

    .line 164
    .end local v6    # "myStackElement":Ljava/lang/StackTraceElement;
    :cond_2a
    const/4 v3, 0x1

    .line 165
    .local v3, "i":I
    iget-object v7, p0, Lrx/exceptions/CompositeException;->exceptions:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_31
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_5a

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Throwable;

    .line 166
    .local v2, "ex":Ljava/lang/Throwable;
    const-string v7, "  ComposedException "

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " :"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\n"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    const-string v7, "\t"

    invoke-direct {p0, v1, v2, v7}, Lrx/exceptions/CompositeException;->appendStackTrace(Ljava/lang/StringBuilder;Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 168
    add-int/lit8 v3, v3, 0x1

    .line 169
    goto :goto_31

    .line 170
    .end local v2    # "ex":Ljava/lang/Throwable;
    :cond_5a
    invoke-virtual {p1}, Lrx/exceptions/CompositeException$PrintStreamOrWriter;->lock()Ljava/lang/Object;

    move-result-object v8

    monitor-enter v8

    .line 171
    :try_start_5f
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1, v7}, Lrx/exceptions/CompositeException$PrintStreamOrWriter;->println(Ljava/lang/Object;)V

    .line 172
    monitor-exit v8

    .line 173
    return-void

    .line 172
    :catchall_68
    move-exception v7

    monitor-exit v8
    :try_end_6a
    .catchall {:try_start_5f .. :try_end_6a} :catchall_68

    throw v7
.end method


# virtual methods
.method public declared-synchronized getCause()Ljava/lang/Throwable;
    .registers 10

    .prologue
    .line 87
    monitor-enter p0

    :try_start_1
    iget-object v8, p0, Lrx/exceptions/CompositeException;->cause:Ljava/lang/Throwable;

    if-nez v8, :cond_5e

    .line 89
    new-instance v0, Lrx/exceptions/CompositeException$CompositeExceptionCausalChain;

    invoke-direct {v0}, Lrx/exceptions/CompositeException$CompositeExceptionCausalChain;-><init>()V

    .line 90
    .local v0, "_cause":Lrx/exceptions/CompositeException$CompositeExceptionCausalChain;
    new-instance v7, Ljava/util/HashSet;

    invoke-direct {v7}, Ljava/util/HashSet;-><init>()V

    .line 92
    .local v7, "seenCauses":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Throwable;>;"
    move-object v1, v0

    .line 93
    .local v1, "chain":Ljava/lang/Throwable;
    iget-object v8, p0, Lrx/exceptions/CompositeException;->exceptions:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_16
    :goto_16
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_5c

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Throwable;

    .line 94
    .local v3, "e":Ljava/lang/Throwable;
    invoke-interface {v7, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_16

    .line 98
    invoke-interface {v7, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 100
    invoke-direct {p0, v3}, Lrx/exceptions/CompositeException;->getListOfCauses(Ljava/lang/Throwable;)Ljava/util/List;

    move-result-object v6

    .line 102
    .local v6, "listOfCauses":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :goto_33
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_54

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Throwable;

    .line 103
    .local v2, "child":Ljava/lang/Throwable;
    invoke-interface {v7, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4d

    .line 105
    new-instance v3, Ljava/lang/RuntimeException;

    .end local v3    # "e":Ljava/lang/Throwable;
    const-string v8, "Duplicate found in causal chain so cropping to prevent loop ..."

    invoke-direct {v3, v8}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 106
    .restart local v3    # "e":Ljava/lang/Throwable;
    goto :goto_33

    .line 108
    :cond_4d
    invoke-interface {v7, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_50
    .catchall {:try_start_1 .. :try_end_50} :catchall_51

    goto :goto_33

    .line 87
    .end local v0    # "_cause":Lrx/exceptions/CompositeException$CompositeExceptionCausalChain;
    .end local v1    # "chain":Ljava/lang/Throwable;
    .end local v2    # "child":Ljava/lang/Throwable;
    .end local v3    # "e":Ljava/lang/Throwable;
    .end local v5    # "i$":Ljava/util/Iterator;
    .end local v6    # "listOfCauses":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    .end local v7    # "seenCauses":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Throwable;>;"
    :catchall_51
    move-exception v8

    monitor-exit p0

    throw v8

    .line 113
    .restart local v0    # "_cause":Lrx/exceptions/CompositeException$CompositeExceptionCausalChain;
    .restart local v1    # "chain":Ljava/lang/Throwable;
    .restart local v3    # "e":Ljava/lang/Throwable;
    .restart local v5    # "i$":Ljava/util/Iterator;
    .restart local v6    # "listOfCauses":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    .restart local v7    # "seenCauses":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Throwable;>;"
    :cond_54
    :try_start_54
    invoke-virtual {v1, v3}, Ljava/lang/Throwable;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;
    :try_end_57
    .catch Ljava/lang/Throwable; {:try_start_54 .. :try_end_57} :catch_62
    .catchall {:try_start_54 .. :try_end_57} :catchall_51

    .line 119
    :goto_57
    :try_start_57
    invoke-virtual {v1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    .line 120
    goto :goto_16

    .line 121
    .end local v3    # "e":Ljava/lang/Throwable;
    .end local v5    # "i$":Ljava/util/Iterator;
    .end local v6    # "listOfCauses":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    :cond_5c
    iput-object v0, p0, Lrx/exceptions/CompositeException;->cause:Ljava/lang/Throwable;

    .line 123
    .end local v0    # "_cause":Lrx/exceptions/CompositeException$CompositeExceptionCausalChain;
    .end local v1    # "chain":Ljava/lang/Throwable;
    .end local v7    # "seenCauses":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Throwable;>;"
    :cond_5e
    iget-object v8, p0, Lrx/exceptions/CompositeException;->cause:Ljava/lang/Throwable;
    :try_end_60
    .catchall {:try_start_57 .. :try_end_60} :catchall_51

    monitor-exit p0

    return-object v8

    .line 114
    .restart local v0    # "_cause":Lrx/exceptions/CompositeException$CompositeExceptionCausalChain;
    .restart local v1    # "chain":Ljava/lang/Throwable;
    .restart local v3    # "e":Ljava/lang/Throwable;
    .restart local v5    # "i$":Ljava/util/Iterator;
    .restart local v6    # "listOfCauses":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Throwable;>;"
    .restart local v7    # "seenCauses":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Throwable;>;"
    :catch_62
    move-exception v8

    goto :goto_57
.end method

.method public getExceptions()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .prologue
    .line 75
    iget-object v0, p0, Lrx/exceptions/CompositeException;->exceptions:Ljava/util/List;

    return-object v0
.end method

.method public getMessage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 80
    iget-object v0, p0, Lrx/exceptions/CompositeException;->message:Ljava/lang/String;

    return-object v0
.end method

.method public printStackTrace()V
    .registers 2

    .prologue
    .line 138
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {p0, v0}, Lrx/exceptions/CompositeException;->printStackTrace(Ljava/io/PrintStream;)V

    .line 139
    return-void
.end method

.method public printStackTrace(Ljava/io/PrintStream;)V
    .registers 3
    .param p1, "s"    # Ljava/io/PrintStream;

    .prologue
    .line 143
    new-instance v0, Lrx/exceptions/CompositeException$WrappedPrintStream;

    invoke-direct {v0, p1}, Lrx/exceptions/CompositeException$WrappedPrintStream;-><init>(Ljava/io/PrintStream;)V

    invoke-direct {p0, v0}, Lrx/exceptions/CompositeException;->printStackTrace(Lrx/exceptions/CompositeException$PrintStreamOrWriter;)V

    .line 144
    return-void
.end method

.method public printStackTrace(Ljava/io/PrintWriter;)V
    .registers 3
    .param p1, "s"    # Ljava/io/PrintWriter;

    .prologue
    .line 148
    new-instance v0, Lrx/exceptions/CompositeException$WrappedPrintWriter;

    invoke-direct {v0, p1}, Lrx/exceptions/CompositeException$WrappedPrintWriter;-><init>(Ljava/io/PrintWriter;)V

    invoke-direct {p0, v0}, Lrx/exceptions/CompositeException;->printStackTrace(Lrx/exceptions/CompositeException$PrintStreamOrWriter;)V

    .line 149
    return-void
.end method
