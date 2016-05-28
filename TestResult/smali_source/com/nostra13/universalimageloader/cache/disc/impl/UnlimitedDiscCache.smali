.class public Lcom/nostra13/universalimageloader/cache/disc/impl/UnlimitedDiscCache;
.super Lcom/nostra13/universalimageloader/cache/disc/impl/BaseDiscCache;
.source "UnlimitedDiscCache.java"


# direct methods
.method public constructor <init>(Ljava/io/File;Ljava/io/File;Lcom/nostra13/universalimageloader/cache/disc/naming/FileNameGenerator;)V
    .registers 4
    .param p1, "cacheDir"    # Ljava/io/File;
    .param p2, "reserveCacheDir"    # Ljava/io/File;
    .param p3, "fileNameGenerator"    # Lcom/nostra13/universalimageloader/cache/disc/naming/FileNameGenerator;

    .prologue
    .line 50
    invoke-direct {p0, p1, p2, p3}, Lcom/nostra13/universalimageloader/cache/disc/impl/BaseDiscCache;-><init>(Ljava/io/File;Ljava/io/File;Lcom/nostra13/universalimageloader/cache/disc/naming/FileNameGenerator;)V

    .line 51
    return-void
.end method
