.class Lit/sephiroth/android/library/picasso/Utils$BitmapHoneycombMR1;
.super Ljava/lang/Object;
.source "Utils.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xc
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/picasso/Utils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BitmapHoneycombMR1"
.end annotation


# direct methods
.method static getByteCount(Landroid/graphics/Bitmap;)I
    .registers 2
    .param p0, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 419
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getByteCount()I

    move-result v0

    return v0
.end method
