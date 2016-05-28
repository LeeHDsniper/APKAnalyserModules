.class public interface abstract Lcom/nostra13/universalimageloader/cache/disc/DiscCacheAware;
.super Ljava/lang/Object;
.source "DiscCacheAware.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# virtual methods
.method public abstract get(Ljava/lang/String;)Ljava/io/File;
.end method

.method public abstract save(Ljava/lang/String;Landroid/graphics/Bitmap;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract save(Ljava/lang/String;Ljava/io/InputStream;Lcom/nostra13/universalimageloader/utils/IoUtils$CopyListener;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
