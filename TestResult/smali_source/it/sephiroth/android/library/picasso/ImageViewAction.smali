.class Lit/sephiroth/android/library/picasso/ImageViewAction;
.super Lit/sephiroth/android/library/picasso/Action;
.source "ImageViewAction.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lit/sephiroth/android/library/picasso/Action",
        "<",
        "Landroid/widget/ImageView;",
        ">;"
    }
.end annotation


# instance fields
.field callback:Lit/sephiroth/android/library/picasso/Callback;


# direct methods
.method constructor <init>(Lit/sephiroth/android/library/picasso/Picasso;Landroid/widget/ImageView;Lit/sephiroth/android/library/picasso/Request;IIILandroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/Object;Lit/sephiroth/android/library/picasso/Callback;J)V
    .registers 28
    .param p1, "picasso"    # Lit/sephiroth/android/library/picasso/Picasso;
    .param p2, "imageView"    # Landroid/widget/ImageView;
    .param p3, "data"    # Lit/sephiroth/android/library/picasso/Request;
    .param p4, "memoryPolicy"    # I
    .param p5, "networkPolicy"    # I
    .param p6, "errorResId"    # I
    .param p7, "errorDrawable"    # Landroid/graphics/drawable/Drawable;
    .param p8, "key"    # Ljava/lang/String;
    .param p9, "tag"    # Ljava/lang/Object;
    .param p10, "callback"    # Lit/sephiroth/android/library/picasso/Callback;
    .param p11, "fadeTime"    # J

    .prologue
    .line 30
    move-object v2, p0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move/from16 v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    move-object/from16 v9, p7

    move-object/from16 v10, p8

    move-object/from16 v11, p9

    move-wide/from16 v12, p11

    invoke-direct/range {v2 .. v13}, Lit/sephiroth/android/library/picasso/Action;-><init>(Lit/sephiroth/android/library/picasso/Picasso;Ljava/lang/Object;Lit/sephiroth/android/library/picasso/Request;IIILandroid/graphics/drawable/Drawable;Ljava/lang/String;Ljava/lang/Object;J)V

    .line 32
    move-object/from16 v0, p10

    iput-object v0, p0, Lit/sephiroth/android/library/picasso/ImageViewAction;->callback:Lit/sephiroth/android/library/picasso/Callback;

    .line 33
    return-void
.end method


# virtual methods
.method cancel()V
    .registers 2

    .prologue
    .line 72
    invoke-super {p0}, Lit/sephiroth/android/library/picasso/Action;->cancel()V

    .line 73
    iget-object v0, p0, Lit/sephiroth/android/library/picasso/ImageViewAction;->callback:Lit/sephiroth/android/library/picasso/Callback;

    if-eqz v0, :cond_a

    .line 74
    const/4 v0, 0x0

    iput-object v0, p0, Lit/sephiroth/android/library/picasso/ImageViewAction;->callback:Lit/sephiroth/android/library/picasso/Callback;

    .line 76
    :cond_a
    return-void
.end method

.method public complete(Landroid/graphics/Bitmap;Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;)V
    .registers 10
    .param p1, "result"    # Landroid/graphics/Bitmap;
    .param p2, "from"    # Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;

    .prologue
    .line 36
    if-nez p1, :cond_14

    .line 37
    new-instance v2, Ljava/lang/AssertionError;

    const-string v3, "Attempted to complete action with no result!\n%s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p0, v4, v5

    .line 38
    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v2

    .line 41
    :cond_14
    iget-object v2, p0, Lit/sephiroth/android/library/picasso/ImageViewAction;->target:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 42
    .local v0, "target":Landroid/widget/ImageView;
    if-nez v0, :cond_1f

    .line 53
    :cond_1e
    :goto_1e
    return-void

    .line 46
    :cond_1f
    iget-object v2, p0, Lit/sephiroth/android/library/picasso/ImageViewAction;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    iget-object v1, v2, Lit/sephiroth/android/library/picasso/Picasso;->context:Landroid/content/Context;

    .line 47
    .local v1, "context":Landroid/content/Context;
    iget-object v2, p0, Lit/sephiroth/android/library/picasso/ImageViewAction;->picasso:Lit/sephiroth/android/library/picasso/Picasso;

    iget-boolean v6, v2, Lit/sephiroth/android/library/picasso/Picasso;->indicatorsEnabled:Z

    .line 48
    .local v6, "indicatorsEnabled":Z
    iget-wide v4, p0, Lit/sephiroth/android/library/picasso/ImageViewAction;->fadeTime:J

    move-object v2, p1

    move-object v3, p2

    invoke-static/range {v0 .. v6}, Lit/sephiroth/android/library/picasso/PicassoDrawable;->setBitmap(Landroid/widget/ImageView;Landroid/content/Context;Landroid/graphics/Bitmap;Lit/sephiroth/android/library/picasso/Picasso$LoadedFrom;JZ)V

    .line 50
    iget-object v2, p0, Lit/sephiroth/android/library/picasso/ImageViewAction;->callback:Lit/sephiroth/android/library/picasso/Callback;

    if-eqz v2, :cond_1e

    .line 51
    iget-object v2, p0, Lit/sephiroth/android/library/picasso/ImageViewAction;->callback:Lit/sephiroth/android/library/picasso/Callback;

    invoke-interface {v2}, Lit/sephiroth/android/library/picasso/Callback;->onSuccess()V

    goto :goto_1e
.end method

.method public error()V
    .registers 3

    .prologue
    .line 56
    iget-object v1, p0, Lit/sephiroth/android/library/picasso/ImageViewAction;->target:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 57
    .local v0, "target":Landroid/widget/ImageView;
    if-nez v0, :cond_b

    .line 69
    :cond_a
    :goto_a
    return-void

    .line 60
    :cond_b
    iget v1, p0, Lit/sephiroth/android/library/picasso/ImageViewAction;->errorResId:I

    if-eqz v1, :cond_1e

    .line 61
    iget v1, p0, Lit/sephiroth/android/library/picasso/ImageViewAction;->errorResId:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 66
    :cond_14
    :goto_14
    iget-object v1, p0, Lit/sephiroth/android/library/picasso/ImageViewAction;->callback:Lit/sephiroth/android/library/picasso/Callback;

    if-eqz v1, :cond_a

    .line 67
    iget-object v1, p0, Lit/sephiroth/android/library/picasso/ImageViewAction;->callback:Lit/sephiroth/android/library/picasso/Callback;

    invoke-interface {v1}, Lit/sephiroth/android/library/picasso/Callback;->onError()V

    goto :goto_a

    .line 62
    :cond_1e
    iget-object v1, p0, Lit/sephiroth/android/library/picasso/ImageViewAction;->errorDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_14

    .line 63
    iget-object v1, p0, Lit/sephiroth/android/library/picasso/ImageViewAction;->errorDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_14
.end method
