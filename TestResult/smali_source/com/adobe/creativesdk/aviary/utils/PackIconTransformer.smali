.class public Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;
.super Ljava/lang/Object;
.source "PackIconTransformer.java"

# interfaces
.implements Lit/sephiroth/android/library/picasso/Transformation;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer$Builder;
    }
.end annotation


# instance fields
.field private generatePalette:Z

.field private imagePath:Ljava/lang/String;

.field private overlayGravity:I

.field private overlayPadding:I

.field private overlayResId:I

.field private packType:Ljava/lang/String;

.field private palette:Landroid/support/v7/graphics/Palette;

.field resourcesRef:Ljava/lang/ref/SoftReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/SoftReference",
            "<",
            "Landroid/content/res/Resources;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$002(Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 21
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->imagePath:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$102(Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 21
    iput-object p1, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->packType:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$202(Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;Z)Z
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;
    .param p1, "x1"    # Z

    .prologue
    .line 21
    iput-boolean p1, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->generatePalette:Z

    return p1
.end method

.method static synthetic access$302(Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;I)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;
    .param p1, "x1"    # I

    .prologue
    .line 21
    iput p1, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->overlayResId:I

    return p1
.end method

.method static synthetic access$402(Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;I)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;
    .param p1, "x1"    # I

    .prologue
    .line 21
    iput p1, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->overlayPadding:I

    return p1
.end method

.method static synthetic access$502(Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;I)I
    .registers 2
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;
    .param p1, "x1"    # I

    .prologue
    .line 21
    iput p1, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->overlayGravity:I

    return p1
.end method


# virtual methods
.method generate(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .registers 13
    .param p1, "res"    # Landroid/content/res/Resources;
    .param p2, "icon"    # Landroid/graphics/Bitmap;

    .prologue
    const/4 v8, 0x0

    .line 107
    if-nez p1, :cond_5

    move-object v4, p2

    .line 149
    .end local p2    # "icon":Landroid/graphics/Bitmap;
    .local v4, "icon":Landroid/graphics/Bitmap;
    :goto_4
    return-object v4

    .line 111
    .end local v4    # "icon":Landroid/graphics/Bitmap;
    .restart local p2    # "icon":Landroid/graphics/Bitmap;
    :cond_5
    iget v7, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->overlayResId:I

    if-eqz v7, :cond_4a

    .line 112
    iget v7, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->overlayResId:I

    invoke-virtual {p1, v7}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 113
    .local v1, "drawable":Landroid/graphics/drawable/Drawable;
    if-eqz v1, :cond_a0

    .line 114
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v6

    .line 115
    .local v6, "w":I
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v3

    .line 117
    .local v3, "h":I
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2, v8, v8, v6, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 119
    .local v2, "drawableBounds":Landroid/graphics/Rect;
    iget v7, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->overlayGravity:I

    and-int/lit8 v7, v7, 0x3

    const/4 v8, 0x3

    if-ne v7, v8, :cond_4c

    .line 127
    :cond_25
    :goto_25
    iget v7, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->overlayGravity:I

    and-int/lit8 v7, v7, 0x30

    const/16 v8, 0x30

    if-ne v7, v8, :cond_75

    .line 135
    :cond_2d
    :goto_2d
    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 137
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v7

    invoke-static {p2, v7}, Lcom/adobe/creativesdk/aviary/internal/utils/BitmapUtils;->copy(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v5

    .line 138
    .local v5, "overlayBitmap":Landroid/graphics/Bitmap;
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, v5}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 139
    .local v0, "canvas":Landroid/graphics/Canvas;
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 141
    invoke-virtual {v5, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_4a

    .line 142
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->recycle()V

    .line 143
    move-object p2, v5

    .end local v0    # "canvas":Landroid/graphics/Canvas;
    .end local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    .end local v2    # "drawableBounds":Landroid/graphics/Rect;
    .end local v3    # "h":I
    .end local v5    # "overlayBitmap":Landroid/graphics/Bitmap;
    .end local v6    # "w":I
    :cond_4a
    :goto_4a
    move-object v4, p2

    .line 149
    .end local p2    # "icon":Landroid/graphics/Bitmap;
    .restart local v4    # "icon":Landroid/graphics/Bitmap;
    goto :goto_4

    .line 121
    .end local v4    # "icon":Landroid/graphics/Bitmap;
    .restart local v1    # "drawable":Landroid/graphics/drawable/Drawable;
    .restart local v2    # "drawableBounds":Landroid/graphics/Rect;
    .restart local v3    # "h":I
    .restart local v6    # "w":I
    .restart local p2    # "icon":Landroid/graphics/Bitmap;
    :cond_4c
    iget v7, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->overlayGravity:I

    and-int/lit8 v7, v7, 0x5

    const/4 v8, 0x5

    if-ne v7, v8, :cond_61

    .line 122
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    sub-int/2addr v7, v6

    iget v8, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->overlayPadding:I

    sub-int/2addr v7, v8

    iget v8, v2, Landroid/graphics/Rect;->top:I

    invoke-virtual {v2, v7, v8}, Landroid/graphics/Rect;->offsetTo(II)V

    goto :goto_25

    .line 123
    :cond_61
    iget v7, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->overlayGravity:I

    and-int/lit8 v7, v7, 0x1

    const/4 v8, 0x1

    if-ne v7, v8, :cond_25

    .line 124
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    sub-int/2addr v7, v6

    div-int/lit8 v7, v7, 0x2

    iget v8, v2, Landroid/graphics/Rect;->top:I

    invoke-virtual {v2, v7, v8}, Landroid/graphics/Rect;->offsetTo(II)V

    goto :goto_25

    .line 129
    :cond_75
    iget v7, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->overlayGravity:I

    and-int/lit8 v7, v7, 0x50

    const/16 v8, 0x50

    if-ne v7, v8, :cond_8b

    .line 130
    iget v7, v2, Landroid/graphics/Rect;->left:I

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    sub-int/2addr v8, v3

    iget v9, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->overlayPadding:I

    sub-int/2addr v8, v9

    invoke-virtual {v2, v7, v8}, Landroid/graphics/Rect;->offsetTo(II)V

    goto :goto_2d

    .line 131
    :cond_8b
    iget v7, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->overlayGravity:I

    and-int/lit8 v7, v7, 0x10

    const/16 v8, 0x10

    if-ne v7, v8, :cond_2d

    .line 132
    iget v7, v2, Landroid/graphics/Rect;->left:I

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    sub-int/2addr v8, v3

    div-int/lit8 v8, v8, 0x2

    invoke-virtual {v2, v7, v8}, Landroid/graphics/Rect;->offsetTo(II)V

    goto :goto_2d

    .line 146
    .end local v2    # "drawableBounds":Landroid/graphics/Rect;
    .end local v3    # "h":I
    .end local v6    # "w":I
    :cond_a0
    const-string v7, "PackIconTransformer"

    const-string v8, "drawable is null"

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4a
.end method

.method public key()Ljava/lang/String;
    .registers 3

    .prologue
    .line 99
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->imagePath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->packType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->overlayResId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public transform(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .registers 5
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 155
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->resourcesRef:Ljava/lang/ref/SoftReference;

    invoke-virtual {v2}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/res/Resources;

    .line 157
    .local v0, "resources":Landroid/content/res/Resources;
    if-nez v0, :cond_c

    .line 158
    const/4 v2, 0x0

    .line 176
    :goto_b
    return-object v2

    .line 162
    :cond_c
    if-eqz p1, :cond_1a

    .line 163
    invoke-virtual {p0, v0, p1}, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->generate(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 165
    .local v1, "result":Landroid/graphics/Bitmap;
    if-eqz v1, :cond_1a

    if-eq v1, p1, :cond_1a

    .line 166
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    .line 167
    move-object p1, v1

    .line 171
    .end local v1    # "result":Landroid/graphics/Bitmap;
    :cond_1a
    iget-boolean v2, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->generatePalette:Z

    if-eqz v2, :cond_2d

    if-eqz p1, :cond_2d

    .line 172
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/utils/SystemUtils;->throwIfUiThread()V

    .line 173
    invoke-static {p1}, Landroid/support/v7/graphics/Palette;->from(Landroid/graphics/Bitmap;)Landroid/support/v7/graphics/Palette$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v7/graphics/Palette$Builder;->generate()Landroid/support/v7/graphics/Palette;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/utils/PackIconTransformer;->palette:Landroid/support/v7/graphics/Palette;

    :cond_2d
    move-object v2, p1

    .line 176
    goto :goto_b
.end method
