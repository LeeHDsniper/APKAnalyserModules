.class public Lcom/behance/sdk/util/CustomHttpEntityWrapper;
.super Lorg/apache/http/entity/HttpEntityWrapper;
.source "CustomHttpEntityWrapper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomFilterOutputStream;,
        Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomHttpEntityWrapperCallback;
    }
.end annotation


# instance fields
.field private final callback:Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomHttpEntityWrapperCallback;


# direct methods
.method public constructor <init>(Lorg/apache/http/HttpEntity;Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomHttpEntityWrapperCallback;)V
    .registers 3
    .param p1, "entity"    # Lorg/apache/http/HttpEntity;
    .param p2, "callback"    # Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomHttpEntityWrapperCallback;

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lorg/apache/http/entity/HttpEntityWrapper;-><init>(Lorg/apache/http/HttpEntity;)V

    .line 20
    iput-object p2, p0, Lcom/behance/sdk/util/CustomHttpEntityWrapper;->callback:Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomHttpEntityWrapperCallback;

    .line 21
    return-void
.end method


# virtual methods
.method public writeTo(Ljava/io/OutputStream;)V
    .registers 9
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 25
    instance-of v0, p1, Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomFilterOutputStream;

    if-eqz v0, :cond_a

    .line 26
    iget-object v0, p0, Lcom/behance/sdk/util/CustomHttpEntityWrapper;->wrappedEntity:Lorg/apache/http/HttpEntity;

    invoke-interface {v0, p1}, Lorg/apache/http/HttpEntity;->writeTo(Ljava/io/OutputStream;)V

    .line 30
    :goto_9
    return-void

    .line 28
    :cond_a
    iget-object v6, p0, Lcom/behance/sdk/util/CustomHttpEntityWrapper;->wrappedEntity:Lorg/apache/http/HttpEntity;

    new-instance v0, Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomFilterOutputStream;

    iget-object v3, p0, Lcom/behance/sdk/util/CustomHttpEntityWrapper;->callback:Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomHttpEntityWrapperCallback;

    invoke-virtual {p0}, Lcom/behance/sdk/util/CustomHttpEntityWrapper;->getContentLength()J

    move-result-wide v4

    move-object v1, p0

    move-object v2, p1

    invoke-direct/range {v0 .. v5}, Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomFilterOutputStream;-><init>(Lcom/behance/sdk/util/CustomHttpEntityWrapper;Ljava/io/OutputStream;Lcom/behance/sdk/util/CustomHttpEntityWrapper$CustomHttpEntityWrapperCallback;J)V

    invoke-interface {v6, v0}, Lorg/apache/http/HttpEntity;->writeTo(Ljava/io/OutputStream;)V

    goto :goto_9
.end method
