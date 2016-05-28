.class Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;
.super Ljava/lang/Object;
.source "IdleConnectionHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/http/impl/conn/IdleConnectionHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TimeValues"
.end annotation


# instance fields
.field private final timeAdded:J

.field private final timeExpires:J


# direct methods
.method constructor <init>(JJLjava/util/concurrent/TimeUnit;)V
    .registers 9
    .param p1, "now"    # J
    .param p3, "validDuration"    # J
    .param p5, "validUnit"    # Ljava/util/concurrent/TimeUnit;

    .prologue
    .line 172
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 173
    iput-wide p1, p0, Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;->timeAdded:J

    .line 174
    const-wide/16 v0, 0x0

    cmp-long v0, p3, v0

    if-lez v0, :cond_13

    .line 175
    invoke-virtual {p5, p3, p4}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    add-long/2addr v0, p1

    iput-wide v0, p0, Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;->timeExpires:J

    .line 179
    :goto_12
    return-void

    .line 177
    :cond_13
    const-wide v0, 0x7fffffffffffffffL

    iput-wide v0, p0, Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;->timeExpires:J

    goto :goto_12
.end method

.method static synthetic access$000(Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;)J
    .registers 3
    .param p0, "x0"    # Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;

    .prologue
    .line 163
    iget-wide v0, p0, Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;->timeExpires:J

    return-wide v0
.end method

.method static synthetic access$100(Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;)J
    .registers 3
    .param p0, "x0"    # Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;

    .prologue
    .line 163
    iget-wide v0, p0, Lorg/apache/http/impl/conn/IdleConnectionHandler$TimeValues;->timeAdded:J

    return-wide v0
.end method
