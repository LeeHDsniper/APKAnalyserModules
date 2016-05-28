.class Lorg/apache/http/client/methods/AbstractExecutionAwareRequest$2;
.super Ljava/lang/Object;
.source "AbstractExecutionAwareRequest.java"

# interfaces
.implements Lorg/apache/http/concurrent/Cancellable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;->setReleaseTrigger(Lorg/apache/http/conn/ConnectionReleaseTrigger;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;

.field final synthetic val$releaseTrigger:Lorg/apache/http/conn/ConnectionReleaseTrigger;


# direct methods
.method constructor <init>(Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;Lorg/apache/http/conn/ConnectionReleaseTrigger;)V
    .registers 3

    .prologue
    .line 80
    iput-object p1, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest$2;->this$0:Lorg/apache/http/client/methods/AbstractExecutionAwareRequest;

    iput-object p2, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest$2;->val$releaseTrigger:Lorg/apache/http/conn/ConnectionReleaseTrigger;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public cancel()Z
    .registers 3

    .prologue
    .line 84
    :try_start_0
    iget-object v1, p0, Lorg/apache/http/client/methods/AbstractExecutionAwareRequest$2;->val$releaseTrigger:Lorg/apache/http/conn/ConnectionReleaseTrigger;

    invoke-interface {v1}, Lorg/apache/http/conn/ConnectionReleaseTrigger;->abortConnection()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_7

    .line 85
    const/4 v1, 0x1

    .line 87
    :goto_6
    return v1

    .line 86
    :catch_7
    move-exception v0

    .line 87
    .local v0, "ex":Ljava/io/IOException;
    const/4 v1, 0x0

    goto :goto_6
.end method
