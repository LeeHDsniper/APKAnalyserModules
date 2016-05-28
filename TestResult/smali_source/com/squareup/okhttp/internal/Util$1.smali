.class final Lcom/squareup/okhttp/internal/Util$1;
.super Ljava/lang/Object;
.source "Util.java"

# interfaces
.implements Ljava/util/concurrent/ThreadFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/squareup/okhttp/internal/Util;->threadFactory(Ljava/lang/String;Z)Ljava/util/concurrent/ThreadFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$daemon:Z

.field final synthetic val$name:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Z)V
    .registers 3

    .prologue
    .line 228
    iput-object p1, p0, Lcom/squareup/okhttp/internal/Util$1;->val$name:Ljava/lang/String;

    iput-boolean p2, p0, Lcom/squareup/okhttp/internal/Util$1;->val$daemon:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 4
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 230
    new-instance v0, Ljava/lang/Thread;

    iget-object v1, p0, Lcom/squareup/okhttp/internal/Util$1;->val$name:Ljava/lang/String;

    invoke-direct {v0, p1, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 231
    .local v0, "result":Ljava/lang/Thread;
    iget-boolean v1, p0, Lcom/squareup/okhttp/internal/Util$1;->val$daemon:Z

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 232
    return-object v0
.end method
