.class Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker$1;
.super Ljava/lang/Object;
.source "ThreadPool.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;->fireOnCancelEvent()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;


# direct methods
.method constructor <init>(Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;)V
    .registers 2
    .param p1, "this$1"    # Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;

    .prologue
    .line 150
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker$1;, "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker$1;"
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker$1;->this$1:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 153
    .local p0, "this":Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker$1;, "Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker$1;"
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker$1;->this$1:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$Worker;->mCancelListener:Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$CancelListener;

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/threading/ThreadPool$CancelListener;->onCancel()V

    .line 154
    return-void
.end method
