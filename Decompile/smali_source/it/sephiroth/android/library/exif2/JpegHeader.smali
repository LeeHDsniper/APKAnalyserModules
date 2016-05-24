.class Lit/sephiroth/android/library/exif2/JpegHeader;
.super Ljava/lang/Object;
.source "JpegHeader.java"


# static fields
.field public static final JFIF_HEADER:[B


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 60
    const/16 v0, 0x12

    new-array v0, v0, [B

    fill-array-data v0, :array_a

    sput-object v0, Lit/sephiroth/android/library/exif2/JpegHeader;->JFIF_HEADER:[B

    return-void

    :array_a
    .array-data 1
        -0x1t
        -0x20t
        0x0t
        0x10t
        0x4at
        0x46t
        0x49t
        0x46t
        0x0t
        0x1t
        0x1t
        0x1t
        0x1t
        0x2ct
        0x1t
        0x2ct
        0x0t
        0x0t
    .end array-data
.end method
