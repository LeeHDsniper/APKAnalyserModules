.class public interface abstract Lcom/squareup/okhttp/internal/spdy/FrameReader;
.super Ljava/lang/Object;
.source "FrameReader.java"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;
    }
.end annotation


# virtual methods
.method public abstract nextFrame(Lcom/squareup/okhttp/internal/spdy/FrameReader$Handler;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract readConnectionPreface()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
