.class public abstract Lit/sephiroth/android/library/picasso/RequestHandler;
.super Ljava/lang/Object;
.source "RequestHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lit/sephiroth/android/library/picasso/RequestHandler$Result;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    return-void
.end method

.method static calculateInSampleSize(IIIILandroid/graphics/BitmapFactory$Options;Lit/sephiroth/android/library/picasso/Request;)V
    .registers 12
    .param p0, "reqWidth"    # I
    .param p1, "reqHeight"    # I
    .param p2, "width"    # I
    .param p3, "height"    # I
    .param p4, "options"    # Landroid/graphics/BitmapFactory$Options;
    .param p5, "request"    # Lit/sephiroth/android/library/picasso/Request;

    .prologue
    .line 155
    const/4 v1, 0x1

    .line 156
    .local v1, "sampleSize":I
    iget-boolean v3, p5, Lit/sephiroth/android/library/picasso/Request;->resizeByMaxSide:Z

    if-eqz v3, :cond_8

    .line 157
    if-lt p2, p3, :cond_1d

    .line 158
    move p1, p0

    .line 163
    :cond_8
    :goto_8
    if-gt p3, p1, :cond_c

    if-le p2, p0, :cond_17

    .line 166
    :cond_c
    if-nez p1, :cond_1f

    .line 167
    int-to-float v3, p2

    int-to-float v4, p0

    div-float/2addr v3, v4

    float-to-double v4, v3

    invoke-static {v4, v5}, Ljava/lang/Math;->floor(D)D

    move-result-wide v4

    double-to-int v1, v4

    .line 178
    :cond_17
    :goto_17
    iput v1, p4, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 179
    const/4 v3, 0x0

    iput-boolean v3, p4, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 180
    return-void

    .line 160
    :cond_1d
    move p0, p1

    goto :goto_8

    .line 168
    :cond_1f
    if-nez p0, :cond_2b

    .line 169
    int-to-float v3, p3

    int-to-float v4, p1

    div-float/2addr v3, v4

    float-to-double v4, v3

    invoke-static {v4, v5}, Ljava/lang/Math;->floor(D)D

    move-result-wide v4

    double-to-int v1, v4

    goto :goto_17

    .line 171
    :cond_2b
    int-to-float v3, p3

    int-to-float v4, p1

    div-float/2addr v3, v4

    float-to-double v4, v3

    invoke-static {v4, v5}, Ljava/lang/Math;->floor(D)D

    move-result-wide v4

    double-to-int v0, v4

    .line 172
    .local v0, "heightRatio":I
    int-to-float v3, p2

    int-to-float v4, p0

    div-float/2addr v3, v4

    float-to-double v4, v3

    invoke-static {v4, v5}, Ljava/lang/Math;->floor(D)D

    move-result-wide v4

    double-to-int v2, v4

    .line 173
    .local v2, "widthRatio":I
    iget-boolean v3, p5, Lit/sephiroth/android/library/picasso/Request;->centerInside:Z

    if-eqz v3, :cond_46

    .line 174
    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 175
    :goto_45
    goto :goto_17

    :cond_46
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    goto :goto_45
.end method

.method static calculateInSampleSize(IILandroid/graphics/BitmapFactory$Options;Lit/sephiroth/android/library/picasso/Request;)V
    .registers 10
    .param p0, "reqWidth"    # I
    .param p1, "reqHeight"    # I
    .param p2, "options"    # Landroid/graphics/BitmapFactory$Options;
    .param p3, "request"    # Lit/sephiroth/android/library/picasso/Request;

    .prologue
    .line 149
    iget v2, p2, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v3, p2, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    move v0, p0

    move v1, p1

    move-object v4, p2

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Lit/sephiroth/android/library/picasso/RequestHandler;->calculateInSampleSize(IIIILandroid/graphics/BitmapFactory$Options;Lit/sephiroth/android/library/picasso/Request;)V

    .line 151
    return-void
.end method

.method static createBitmapOptions(Lit/sephiroth/android/library/picasso/Request;)Landroid/graphics/BitmapFactory$Options;
    .registers 5
    .param p0, "data"    # Lit/sephiroth/android/library/picasso/Request;

    .prologue
    .line 130
    invoke-virtual {p0}, Lit/sephiroth/android/library/picasso/Request;->hasSize()Z

    move-result v1

    .line 131
    .local v1, "justBounds":Z
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/Request;->config:Landroid/graphics/Bitmap$Config;

    if-eqz v3, :cond_1c

    const/4 v0, 0x1

    .line 132
    .local v0, "hasConfig":Z
    :goto_9
    const/4 v2, 0x0

    .line 133
    .local v2, "options":Landroid/graphics/BitmapFactory$Options;
    if-nez v1, :cond_e

    if-eqz v0, :cond_1b

    .line 134
    :cond_e
    new-instance v2, Landroid/graphics/BitmapFactory$Options;

    .end local v2    # "options":Landroid/graphics/BitmapFactory$Options;
    invoke-direct {v2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 135
    .restart local v2    # "options":Landroid/graphics/BitmapFactory$Options;
    iput-boolean v1, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 136
    if-eqz v0, :cond_1b

    .line 137
    iget-object v3, p0, Lit/sephiroth/android/library/picasso/Request;->config:Landroid/graphics/Bitmap$Config;

    iput-object v3, v2, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    .line 140
    :cond_1b
    return-object v2

    .line 131
    .end local v0    # "hasConfig":Z
    .end local v2    # "options":Landroid/graphics/BitmapFactory$Options;
    :cond_1c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method static requiresInSampleSize(Landroid/graphics/BitmapFactory$Options;)Z
    .registers 2
    .param p0, "options"    # Landroid/graphics/BitmapFactory$Options;

    .prologue
    .line 144
    if-eqz p0, :cond_8

    iget-boolean v0, p0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method


# virtual methods
.method public abstract canHandleRequest(Lit/sephiroth/android/library/picasso/Request;)Z
.end method

.method getRetryCount()I
    .registers 2

    .prologue
    .line 114
    const/4 v0, 0x0

    return v0
.end method

.method public abstract load(Lit/sephiroth/android/library/picasso/Request;I)Lit/sephiroth/android/library/picasso/RequestHandler$Result;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method shouldRetry(ZLandroid/net/NetworkInfo;)Z
    .registers 4
    .param p1, "airplaneMode"    # Z
    .param p2, "info"    # Landroid/net/NetworkInfo;

    .prologue
    .line 118
    const/4 v0, 0x0

    return v0
.end method

.method supportsReplay()Z
    .registers 2

    .prologue
    .line 122
    const/4 v0, 0x0

    return v0
.end method
