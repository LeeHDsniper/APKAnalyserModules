.class Lit/sephiroth/android/library/picasso/Utils$OkHttpLoaderCreator;
.super Ljava/lang/Object;
.source "Utils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/picasso/Utils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "OkHttpLoaderCreator"
.end annotation


# direct methods
.method static create(Landroid/content/Context;)Lit/sephiroth/android/library/picasso/Downloader;
    .registers 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 425
    new-instance v0, Lit/sephiroth/android/library/picasso/OkHttpDownloader;

    invoke-direct {v0, p0}, Lit/sephiroth/android/library/picasso/OkHttpDownloader;-><init>(Landroid/content/Context;)V

    return-object v0
.end method
