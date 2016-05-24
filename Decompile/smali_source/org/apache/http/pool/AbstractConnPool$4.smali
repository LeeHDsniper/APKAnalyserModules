.class Lorg/apache/http/pool/AbstractConnPool$4;
.super Ljava/lang/Object;
.source "AbstractConnPool.java"

# interfaces
.implements Lorg/apache/http/pool/PoolEntryCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/http/pool/AbstractConnPool;->closeExpired()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/apache/http/pool/PoolEntryCallback",
        "<TT;TC;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/http/pool/AbstractConnPool;

.field final synthetic val$now:J


# direct methods
.method constructor <init>(Lorg/apache/http/pool/AbstractConnPool;J)V
    .registers 4

    .prologue
    .line 500
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool$4;, "Lorg/apache/http/pool/AbstractConnPool.4;"
    iput-object p1, p0, Lorg/apache/http/pool/AbstractConnPool$4;->this$0:Lorg/apache/http/pool/AbstractConnPool;

    iput-wide p2, p0, Lorg/apache/http/pool/AbstractConnPool$4;->val$now:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public process(Lorg/apache/http/pool/PoolEntry;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/pool/PoolEntry",
            "<TT;TC;>;)V"
        }
    .end annotation

    .prologue
    .line 503
    .local p0, "this":Lorg/apache/http/pool/AbstractConnPool$4;, "Lorg/apache/http/pool/AbstractConnPool.4;"
    .local p1, "entry":Lorg/apache/http/pool/PoolEntry;, "Lorg/apache/http/pool/PoolEntry<TT;TC;>;"
    iget-wide v0, p0, Lorg/apache/http/pool/AbstractConnPool$4;->val$now:J

    invoke-virtual {p1, v0, v1}, Lorg/apache/http/pool/PoolEntry;->isExpired(J)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 504
    invoke-virtual {p1}, Lorg/apache/http/pool/PoolEntry;->close()V

    .line 506
    :cond_b
    return-void
.end method
