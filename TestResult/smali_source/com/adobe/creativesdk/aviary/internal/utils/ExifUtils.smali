.class public final Lcom/adobe/creativesdk/aviary/internal/utils/ExifUtils;
.super Ljava/lang/Object;
.source "ExifUtils.java"


# static fields
.field private static logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 13
    const-string v0, "ExifUtils"

    sget-object v1, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;->ConsoleLoggerType:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory;->getLogger(Ljava/lang/String;Lcom/adobe/creativesdk/aviary/log/LoggerFactory$LoggerType;)Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-result-object v0

    sput-object v0, Lcom/adobe/creativesdk/aviary/internal/utils/ExifUtils;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    return-void
.end method

.method public static getOrientation(Lit/sephiroth/android/library/exif2/ExifInterface;)I
    .registers 3
    .param p0, "exif"    # Lit/sephiroth/android/library/exif2/ExifInterface;

    .prologue
    .line 66
    sget v1, Lit/sephiroth/android/library/exif2/ExifInterface;->TAG_ORIENTATION:I

    invoke-virtual {p0, v1}, Lit/sephiroth/android/library/exif2/ExifInterface;->getTagIntValue(I)Ljava/lang/Integer;

    move-result-object v0

    .line 67
    .local v0, "val":Ljava/lang/Integer;
    if-nez v0, :cond_a

    .line 68
    const/4 v1, 0x0

    .line 70
    :goto_9
    return v1

    :cond_a
    invoke-virtual {v0}, Ljava/lang/Integer;->shortValue()S

    move-result v1

    invoke-static {v1}, Lit/sephiroth/android/library/exif2/ExifInterface;->getRotationForOrientationValue(S)I

    move-result v1

    goto :goto_9
.end method
