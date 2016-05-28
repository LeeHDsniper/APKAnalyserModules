.class Lit/sephiroth/android/library/exif2/ExifParser$IfdEvent;
.super Ljava/lang/Object;
.source "ExifParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lit/sephiroth/android/library/exif2/ExifParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "IfdEvent"
.end annotation


# instance fields
.field ifd:I

.field isRequested:Z


# direct methods
.method constructor <init>(IZ)V
    .registers 3
    .param p1, "ifd"    # I
    .param p2, "isInterestedIfd"    # Z

    .prologue
    .line 1078
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1079
    iput p1, p0, Lit/sephiroth/android/library/exif2/ExifParser$IfdEvent;->ifd:I

    .line 1080
    iput-boolean p2, p0, Lit/sephiroth/android/library/exif2/ExifParser$IfdEvent;->isRequested:Z

    .line 1081
    return-void
.end method
