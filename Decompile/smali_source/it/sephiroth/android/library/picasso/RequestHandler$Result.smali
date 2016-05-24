.class public final Lit/sephiroth/android/library/picasso/RequestHandler$Result;
.super Ljava/lang/Object;
.source "RequestHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/picasso/RequestHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Result"
.end annotation


# instance fields
.field private final bitmap:Landroid/graphics/Bitmap;

.field private final exifOrientation:I

.field private final loadedFrom:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

.field private final stream:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;)V
    .registers 6
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "loadedFrom"    # Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    .prologue
    .line 56
    const-string v0, "bitmap == null"

    invoke-static {p1, v0}, Lit/sephiroth/android/library/picasso/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, p2, v2}, Lit/sephiroth/android/library/picasso/RequestHandler$Result;-><init>(Landroid/graphics/Bitmap;Ljava/io/InputStream;Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;I)V

    .line 57
    return-void
.end method

.method constructor <init>(Landroid/graphics/Bitmap;Ljava/io/InputStream;Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;I)V
    .registers 8
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "stream"    # Ljava/io/InputStream;
    .param p3, "loadedFrom"    # Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;
    .param p4, "exifOrientation"    # I

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    if-eqz p1, :cond_13

    move v2, v0

    :goto_8
    if-eqz p2, :cond_15

    :goto_a
    xor-int/2addr v0, v2

    if-nez v0, :cond_17

    .line 65
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    :cond_13
    move v2, v1

    .line 64
    goto :goto_8

    :cond_15
    move v0, v1

    goto :goto_a

    .line 67
    :cond_17
    iput-object p1, p0, Lit/sephiroth/android/library/picasso/RequestHandler$Result;->bitmap:Landroid/graphics/Bitmap;

    .line 68
    iput-object p2, p0, Lit/sephiroth/android/library/picasso/RequestHandler$Result;->stream:Ljava/io/InputStream;

    .line 69
    const-string v0, "loadedFrom == null"

    invoke-static {p3, v0}, Lit/sephiroth/android/library/picasso/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    iput-object v0, p0, Lit/sephiroth/android/library/picasso/RequestHandler$Result;->loadedFrom:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    .line 70
    iput p4, p0, Lit/sephiroth/android/library/picasso/RequestHandler$Result;->exifOrientation:I

    .line 71
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;)V
    .registers 6
    .param p1, "stream"    # Ljava/io/InputStream;
    .param p2, "loadedFrom"    # Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    .prologue
    .line 60
    const/4 v1, 0x0

    const-string v0, "stream == null"

    invoke-static {p1, v0}, Lit/sephiroth/android/library/picasso/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/InputStream;

    const/4 v2, 0x0

    invoke-direct {p0, v1, v0, p2, v2}, Lit/sephiroth/android/library/picasso/RequestHandler$Result;-><init>(Landroid/graphics/Bitmap;Ljava/io/InputStream;Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;I)V

    .line 61
    return-void
.end method


# virtual methods
.method public getBitmap()Landroid/graphics/Bitmap;
    .registers 2

    .prologue
    .line 75
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/RequestHandler$Result;->bitmap:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method getExifOrientation()I
    .registers 2

    .prologue
    .line 96
    iget v0, p0, Lit/sephiroth/android/library/picasso/RequestHandler$Result;->exifOrientation:I

    return v0
.end method

.method public getLoadedFrom()Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;
    .registers 2

    .prologue
    .line 88
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/RequestHandler$Result;->loadedFrom:Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    return-object v0
.end method

.method public getStream()Ljava/io/InputStream;
    .registers 2

    .prologue
    .line 80
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/RequestHandler$Result;->stream:Ljava/io/InputStream;

    return-object v0
.end method
