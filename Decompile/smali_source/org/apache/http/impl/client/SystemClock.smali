.class Lorg/apache/http/impl/client/SystemClock;
.super Ljava/lang/Object;
.source "SystemClock.java"

# interfaces
.implements Lorg/apache/http/impl/client/Clock;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getCurrentTime()J
    .registers 3

    .prologue
    .line 37
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    return-wide v0
.end method
