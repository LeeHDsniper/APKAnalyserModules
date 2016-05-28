.class public Lcom/adobe/creativesdk/aviary/panels/TextPanel;
.super Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;
.source "TextPanel.java"

# interfaces
.implements Landroid/view/View$OnKeyListener;
.implements Landroid/widget/TextView$OnEditorActionListener;
.implements Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;
.implements Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay$OnDrawableEventListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/panels/TextPanel$MyTextWatcher;
    }
.end annotation


# instance fields
.field private config:Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

.field private mCanvas:Landroid/graphics/Canvas;

.field private mColor:I

.field mColorContentDescription:Ljava/lang/String;

.field private mColors:[I

.field private mDefaultTextSize:I

.field private mEditText:Landroid/widget/EditText;

.field private final mEditTextWatcher:Lcom/adobe/creativesdk/aviary/panels/TextPanel$MyTextWatcher;

.field private mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

.field mToolAction:Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V
    .registers 4
    .param p1, "context"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;
    .param p2, "entry"    # Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    .prologue
    .line 101
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V

    .line 66
    const/4 v0, 0x0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mColor:I

    .line 76
    new-instance v0, Lcom/adobe/creativesdk/aviary/panels/TextPanel$1;

    invoke-direct {v0, p0}, Lcom/adobe/creativesdk/aviary/panels/TextPanel$1;-><init>(Lcom/adobe/creativesdk/aviary/panels/TextPanel;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mEditTextWatcher:Lcom/adobe/creativesdk/aviary/panels/TextPanel$MyTextWatcher;

    .line 102
    new-instance v0, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    invoke-direct {v0}, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;-><init>()V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mToolAction:Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    .line 103
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/panels/TextPanel;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/TextPanel;

    .prologue
    .line 57
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->onAddNewText()V

    return-void
.end method

.method private beginEdit(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V
    .registers 7
    .param p1, "view"    # Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .prologue
    .line 106
    const/4 v3, 0x1

    invoke-virtual {p1, v3}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->setFocused(Z)V

    .line 107
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->postInvalidate()V

    .line 109
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mEditTextWatcher:Lcom/adobe/creativesdk/aviary/panels/TextPanel$MyTextWatcher;

    const/4 v4, 0x0

    iput-object v4, v3, Lcom/adobe/creativesdk/aviary/panels/TextPanel$MyTextWatcher;->view:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .line 110
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mEditText:Landroid/widget/EditText;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mEditTextWatcher:Lcom/adobe/creativesdk/aviary/panels/TextPanel$MyTextWatcher;

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 112
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    .line 113
    .local v0, "editable":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;
    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->isTextHint()Z

    move-result v3

    if-eqz v3, :cond_61

    const-string v2, ""

    .line 114
    .local v2, "oldText":Ljava/lang/String;
    :goto_23
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v3, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 115
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mEditText:Landroid/widget/EditText;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->length()I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->setSelection(I)V

    .line 116
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->requestFocusFromTouch()Z

    .line 119
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "input_method"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/inputmethod/InputMethodManager;

    .line 120
    .local v1, "manager":Landroid/view/inputmethod/InputMethodManager;
    if-eqz v1, :cond_50

    .line 122
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mEditText:Landroid/widget/EditText;

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 125
    :cond_50
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mEditTextWatcher:Lcom/adobe/creativesdk/aviary/panels/TextPanel$MyTextWatcher;

    iput-object p1, v3, Lcom/adobe/creativesdk/aviary/panels/TextPanel$MyTextWatcher;->view:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .line 126
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v3, p0}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 127
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mEditText:Landroid/widget/EditText;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mEditTextWatcher:Lcom/adobe/creativesdk/aviary/panels/TextPanel$MyTextWatcher;

    invoke-virtual {v3, v4}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 128
    return-void

    .line 113
    .end local v1    # "manager":Landroid/view/inputmethod/InputMethodManager;
    .end local v2    # "oldText":Ljava/lang/String;
    :cond_61
    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    move-object v2, v3

    goto :goto_23
.end method

.method private createAndConfigurePreview()V
    .registers 3

    .prologue
    .line 132
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mPreview:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_14

    .line 133
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 134
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mPreview:Landroid/graphics/Bitmap;

    .line 137
    :cond_14
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/BitmapUtils;->copy(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mPreview:Landroid/graphics/Bitmap;

    .line 138
    new-instance v0, Landroid/graphics/Canvas;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mCanvas:Landroid/graphics/Canvas;

    .line 139
    return-void
.end method

.method private endEdit(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V
    .registers 6
    .param p1, "view"    # Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .prologue
    const/4 v3, 0x0

    .line 142
    if-eqz p1, :cond_15

    .line 143
    invoke-virtual {p1, v3}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->setFocused(Z)V

    .line 144
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->forceUpdate()Z

    move-result v1

    if-eqz v1, :cond_45

    .line 145
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getInvalidationRect()Landroid/graphics/Rect;

    move-result-object v2

    invoke-virtual {v1, v2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->invalidate(Landroid/graphics/Rect;)V

    .line 150
    :cond_15
    :goto_15
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mEditTextWatcher:Lcom/adobe/creativesdk/aviary/panels/TextPanel$MyTextWatcher;

    const/4 v2, 0x0

    iput-object v2, v1, Lcom/adobe/creativesdk/aviary/panels/TextPanel$MyTextWatcher;->view:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .line 151
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mEditText:Landroid/widget/EditText;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mEditTextWatcher:Lcom/adobe/creativesdk/aviary/panels/TextPanel$MyTextWatcher;

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 154
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 155
    .local v0, "manager":Landroid/view/inputmethod/InputMethodManager;
    if-eqz v0, :cond_44

    .line 156
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/view/inputmethod/InputMethodManager;->isActive(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_44

    .line 157
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    invoke-virtual {v0, v1, v3}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 160
    :cond_44
    return-void

    .line 147
    .end local v0    # "manager":Landroid/view/inputmethod/InputMethodManager;
    :cond_45
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->postInvalidate()V

    goto :goto_15
.end method

.method private onAddNewText()V
    .registers 23

    .prologue
    .line 197
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v12, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    .line 199
    .local v12, "image":Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;
    invoke-virtual {v12}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getHighlightCount()I

    move-result v3

    if-lez v3, :cond_16

    .line 200
    const/4 v3, 0x0

    invoke-virtual {v12, v3}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getHighlightViewAt(I)Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->onApplyCurrent(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    .line 203
    :cond_16
    new-instance v16, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;

    const-string v3, ""

    move-object/from16 v0, p0

    iget v7, v0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mDefaultTextSize:I

    int-to-float v7, v7

    move-object/from16 v0, v16

    invoke-direct {v0, v3, v7}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;-><init>(Ljava/lang/String;F)V

    .line 204
    .local v16, "text":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;
    move-object/from16 v0, p0

    iget v3, v0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mColor:I

    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->setTextColor(I)V

    .line 205
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->config:Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    sget v7, Lcom/aviary/android/feather/sdk/R$bool;->com_adobe_image_editori_text_stroke_enabled:I

    invoke-virtual {v3, v7}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getBoolean(I)Z

    move-result v3

    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->setStrokeEnabled(Z)V

    .line 206
    const/4 v3, 0x2

    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->setCursorWidth(I)V

    .line 207
    const/high16 v3, 0x41600000

    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->setMinTextSize(F)V

    .line 208
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getHint()Ljava/lang/CharSequence;

    move-result-object v3

    move-object/from16 v0, v16

    invoke-virtual {v0, v3}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->setTextHint(Ljava/lang/CharSequence;)V

    .line 210
    new-instance v2, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v12}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getOverlayStyleId()I

    move-result v7

    move-object/from16 v0, v16

    invoke-direct {v2, v3, v7, v0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;-><init>(Lit/sephiroth/android/library/imagezoom/ImageViewTouch;ILcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;)V

    .line 212
    .local v2, "hv":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getImageViewMatrix()Landroid/graphics/Matrix;

    move-result-object v4

    .line 214
    .local v4, "mImageMatrix":Landroid/graphics/Matrix;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getWidth()I

    move-result v17

    .line 215
    .local v17, "width":I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getHeight()I

    move-result v11

    .line 216
    .local v11, "height":I
    move/from16 v0, v17

    invoke-static {v0, v11}, Ljava/lang/Math;->max(II)I

    move-result v13

    .line 219
    .local v13, "imageSize":I
    invoke-virtual/range {v16 .. v16}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->getIntrinsicWidth()I

    move-result v10

    .line 220
    .local v10, "cropWidth":I
    invoke-virtual/range {v16 .. v16}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageTextDrawable;->getIntrinsicHeight()I

    move-result v8

    .line 222
    .local v8, "cropHeight":I
    invoke-static {v10, v8}, Ljava/lang/Math;->max(II)I

    move-result v9

    .line 224
    .local v9, "cropSize":I
    if-le v9, v13, :cond_95

    .line 225
    div-int/lit8 v10, v17, 0x2

    .line 226
    div-int/lit8 v8, v11, 0x2

    .line 229
    :cond_95
    sub-int v3, v17, v10

    div-int/lit8 v18, v3, 0x2

    .line 230
    .local v18, "x":I
    sub-int v3, v11, v8

    div-int/lit8 v19, v3, 0x2

    .line 232
    .local v19, "y":I
    new-instance v14, Landroid/graphics/Matrix;

    invoke-direct {v14, v4}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    .line 233
    .local v14, "matrix":Landroid/graphics/Matrix;
    invoke-virtual {v14, v14}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 235
    const/4 v3, 0x4

    new-array v15, v3, [F

    const/4 v3, 0x0

    move/from16 v0, v18

    int-to-float v7, v0

    aput v7, v15, v3

    const/4 v3, 0x1

    move/from16 v0, v19

    int-to-float v7, v0

    aput v7, v15, v3

    const/4 v3, 0x2

    add-int v7, v18, v10

    int-to-float v7, v7

    aput v7, v15, v3

    const/4 v3, 0x3

    add-int v7, v19, v8

    int-to-float v7, v7

    aput v7, v15, v3

    .line 236
    .local v15, "pts":[F
    invoke-static {v14, v15}, Lcom/adobe/creativesdk/aviary/internal/utils/MatrixUtils;->mapPoints(Landroid/graphics/Matrix;[F)V

    .line 238
    new-instance v6, Landroid/graphics/RectF;

    const/4 v3, 0x0

    aget v3, v15, v3

    const/4 v7, 0x1

    aget v7, v15, v7

    const/16 v20, 0x2

    aget v20, v15, v20

    const/16 v21, 0x3

    aget v21, v15, v21

    move/from16 v0, v20

    move/from16 v1, v21

    invoke-direct {v6, v3, v7, v0, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 239
    .local v6, "cropRect":Landroid/graphics/RectF;
    new-instance v5, Landroid/graphics/Rect;

    const/4 v3, 0x0

    const/4 v7, 0x0

    move/from16 v0, v17

    invoke-direct {v5, v3, v7, v0, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 241
    .local v5, "imageRect":Landroid/graphics/Rect;
    invoke-virtual/range {p0 .. p0}, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v3

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->setup(Landroid/content/Context;Landroid/graphics/Matrix;Landroid/graphics/Rect;Landroid/graphics/RectF;Z)V

    .line 243
    invoke-virtual {v12, v2}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->addHighlightView(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)Z

    .line 244
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->onClick(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    .line 245
    return-void
.end method

.method private onApplyCurrent()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
    .registers 7

    .prologue
    .line 248
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionFactory;->actionList()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v3

    .line 249
    .local v3, "nullActions":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v2, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    .line 250
    .local v2, "image":Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getHighlightCount()I

    move-result v4

    const/4 v5, 0x1

    if-ge v4, v5, :cond_10

    .line 267
    .end local v3    # "nullActions":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
    :cond_f
    :goto_f
    return-object v3

    .line 253
    .restart local v3    # "nullActions":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
    :cond_10
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v4, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getHighlightViewAt(I)Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    move-result-object v1

    .line 255
    .local v1, "hv":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    if-eqz v1, :cond_f

    .line 257
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v4

    instance-of v4, v4, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    if-eqz v4, :cond_31

    .line 258
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    .line 259
    .local v0, "editable":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;
    if-eqz v0, :cond_31

    .line 260
    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->isTextHint()Z

    move-result v4

    if-nez v4, :cond_f

    .line 265
    .end local v0    # "editable":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;
    :cond_31
    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->onApplyCurrent(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v3

    goto :goto_f
.end method

.method private onApplyCurrent(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
    .registers 24
    .param p1, "hv"    # Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .prologue
    .line 273
    if-eqz p1, :cond_179

    .line 274
    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getCropRectF()Landroid/graphics/RectF;

    move-result-object v6

    .line 275
    .local v6, "cropRect":Landroid/graphics/RectF;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lcom/adobe/creativesdk/aviary/internal/utils/MatrixUtils;->getScale(Landroid/graphics/Matrix;)[F

    move-result-object v18

    const/16 v19, 0x0

    aget v15, v18, v19

    .line 277
    .local v15, "scale":F
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    move-object/from16 v18, v0

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "cropRect: "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-interface/range {v18 .. v19}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 279
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v17

    .line 280
    .local v17, "w":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mBitmap:Landroid/graphics/Bitmap;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v9

    .line 282
    .local v9, "h":I
    iget v10, v6, Landroid/graphics/RectF;->left:F

    .line 283
    .local v10, "left":F
    iget v0, v6, Landroid/graphics/RectF;->top:F

    move/from16 v16, v0

    .line 284
    .local v16, "top":F
    iget v12, v6, Landroid/graphics/RectF;->right:F

    .line 285
    .local v12, "right":F
    iget v5, v6, Landroid/graphics/RectF;->bottom:F

    .line 288
    .local v5, "bottom":F
    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v7

    check-cast v7, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    .line 289
    .local v7, "editable":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;
    invoke-interface {v7}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->endEdit()V

    .line 291
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->invalidate()V

    .line 294
    sget-object v18, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->TEXT:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    invoke-static/range {v18 .. v18}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory;->get(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    move-result-object v8

    check-cast v8, Lcom/adobe/creativesdk/aviary/internal/filters/TextFilter;

    .line 295
    .local v8, "filter":Lcom/adobe/creativesdk/aviary/internal/filters/TextFilter;
    move/from16 v0, v17

    invoke-virtual {v8, v0, v9}, Lcom/adobe/creativesdk/aviary/internal/filters/TextFilter;->setPreviewSize(II)V

    .line 296
    invoke-interface {v7}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->getText()Ljava/lang/CharSequence;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v8, v0}, Lcom/adobe/creativesdk/aviary/internal/filters/TextFilter;->setText(Ljava/lang/CharSequence;)V

    .line 297
    invoke-interface {v7}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->getTextColor()I

    move-result v18

    move/from16 v0, v18

    invoke-virtual {v8, v0}, Lcom/adobe/creativesdk/aviary/internal/filters/TextFilter;->setFillColor(I)V

    .line 298
    invoke-interface {v7}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->getStrokeEnabled()Z

    move-result v18

    if-eqz v18, :cond_175

    invoke-interface {v7}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->getTextStrokeColor()I

    move-result v18

    :goto_8f
    move/from16 v0, v18

    invoke-virtual {v8, v0}, Lcom/adobe/creativesdk/aviary/internal/filters/TextFilter;->setStrokeColor(I)V

    .line 299
    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getRotation()F

    move-result v18

    move/from16 v0, v18

    invoke-virtual {v8, v0}, Lcom/adobe/creativesdk/aviary/internal/filters/TextFilter;->setRotation(F)V

    .line 300
    move/from16 v0, v16

    float-to-double v0, v0

    move-wide/from16 v18, v0

    float-to-double v0, v10

    move-wide/from16 v20, v0

    move-wide/from16 v0, v18

    move-wide/from16 v2, v20

    invoke-virtual {v8, v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/filters/TextFilter;->setTopLeft(DD)V

    .line 301
    float-to-double v0, v5

    move-wide/from16 v18, v0

    float-to-double v0, v12

    move-wide/from16 v20, v0

    move-wide/from16 v0, v18

    move-wide/from16 v2, v20

    invoke-virtual {v8, v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/internal/filters/TextFilter;->setBottomRight(DD)V

    .line 302
    invoke-interface {v7}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->getTextSize()F

    move-result v18

    div-float v18, v18, v15

    move/from16 v0, v18

    float-to-double v0, v0

    move-wide/from16 v18, v0

    move-wide/from16 v0, v18

    invoke-virtual {v8, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/filters/TextFilter;->setTextSize(D)V

    .line 304
    invoke-virtual {v8}, Lcom/adobe/creativesdk/aviary/internal/filters/TextFilter;->getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->clone()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    .line 305
    .local v4, "actionList":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mToolAction:Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    move-object/from16 v19, v0

    invoke-interface {v7}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->getText()Ljava/lang/CharSequence;

    move-result-object v18

    check-cast v18, Ljava/lang/String;

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;->setValue(Ljava/lang/Object;)V

    .line 308
    new-instance v11, Landroid/graphics/Rect;

    iget v0, v6, Landroid/graphics/RectF;->left:F

    move/from16 v18, v0

    move/from16 v0, v18

    float-to-int v0, v0

    move/from16 v18, v0

    iget v0, v6, Landroid/graphics/RectF;->top:F

    move/from16 v19, v0

    move/from16 v0, v19

    float-to-int v0, v0

    move/from16 v19, v0

    iget v0, v6, Landroid/graphics/RectF;->right:F

    move/from16 v20, v0

    move/from16 v0, v20

    float-to-int v0, v0

    move/from16 v20, v0

    iget v0, v6, Landroid/graphics/RectF;->bottom:F

    move/from16 v21, v0

    move/from16 v0, v21

    float-to-int v0, v0

    move/from16 v21, v0

    move/from16 v0, v18

    move/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v21

    invoke-direct {v11, v0, v1, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 309
    .local v11, "rect":Landroid/graphics/Rect;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mCanvas:Landroid/graphics/Canvas;

    move-object/from16 v18, v0

    const/16 v19, 0x1

    invoke-virtual/range {v18 .. v19}, Landroid/graphics/Canvas;->save(I)I

    move-result v14

    .line 310
    .local v14, "saveCount":I
    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getCropRotationMatrix()Landroid/graphics/Matrix;

    move-result-object v13

    .line 311
    .local v13, "rotateMatrix":Landroid/graphics/Matrix;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mCanvas:Landroid/graphics/Canvas;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v13}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    .line 312
    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v0, v11}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;->setBounds(Landroid/graphics/Rect;)V

    .line 313
    invoke-virtual/range {p1 .. p1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mCanvas:Landroid/graphics/Canvas;

    move-object/from16 v19, v0

    invoke-interface/range {v18 .. v19}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 314
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mCanvas:Landroid/graphics/Canvas;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 316
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->invalidate()V

    .line 317
    invoke-direct/range {p0 .. p1}, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->onClearCurrent(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    .line 323
    .end local v5    # "bottom":F
    .end local v6    # "cropRect":Landroid/graphics/RectF;
    .end local v7    # "editable":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;
    .end local v8    # "filter":Lcom/adobe/creativesdk/aviary/internal/filters/TextFilter;
    .end local v9    # "h":I
    .end local v10    # "left":F
    .end local v11    # "rect":Landroid/graphics/Rect;
    .end local v12    # "right":F
    .end local v13    # "rotateMatrix":Landroid/graphics/Matrix;
    .end local v14    # "saveCount":I
    .end local v15    # "scale":F
    .end local v16    # "top":F
    .end local v17    # "w":I
    :goto_15f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mPreview:Landroid/graphics/Bitmap;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    const/16 v20, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move/from16 v2, v19

    move/from16 v3, v20

    invoke-virtual {v0, v1, v2, v3}, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->onPreviewChanged(Landroid/graphics/Bitmap;ZZ)V

    .line 324
    return-object v4

    .line 298
    .end local v4    # "actionList":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
    .restart local v5    # "bottom":F
    .restart local v6    # "cropRect":Landroid/graphics/RectF;
    .restart local v7    # "editable":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;
    .restart local v8    # "filter":Lcom/adobe/creativesdk/aviary/internal/filters/TextFilter;
    .restart local v9    # "h":I
    .restart local v10    # "left":F
    .restart local v12    # "right":F
    .restart local v15    # "scale":F
    .restart local v16    # "top":F
    .restart local v17    # "w":I
    :cond_175
    const/16 v18, 0x0

    goto/16 :goto_8f

    .line 320
    .end local v5    # "bottom":F
    .end local v6    # "cropRect":Landroid/graphics/RectF;
    .end local v7    # "editable":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;
    .end local v8    # "filter":Lcom/adobe/creativesdk/aviary/internal/filters/TextFilter;
    .end local v9    # "h":I
    .end local v10    # "left":F
    .end local v12    # "right":F
    .end local v15    # "scale":F
    .end local v16    # "top":F
    .end local v17    # "w":I
    :cond_179
    invoke-static {}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionFactory;->actionList()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v4

    .restart local v4    # "actionList":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
    goto :goto_15f
.end method

.method private onClearCurrent(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V
    .registers 3
    .param p1, "hv"    # Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .prologue
    .line 328
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->setOnDeleteClickListener(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$OnDeleteClickListener;)V

    .line 329
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    invoke-virtual {v0, p1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->removeHightlightView(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)Z

    .line 330
    return-void
.end method

.method private updateCurrentHighlightColor()V
    .registers 5

    .prologue
    .line 536
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    .line 538
    .local v1, "image":Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getSelectedHighlightView()Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    move-result-object v0

    .line 539
    .local v0, "current":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    if-nez v0, :cond_15

    .line 540
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getHighlightCount()I

    move-result v2

    if-lez v2, :cond_15

    .line 541
    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getHighlightViewAt(I)Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    move-result-object v0

    .line 545
    :cond_15
    if-eqz v0, :cond_2f

    .line 546
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v2

    instance-of v2, v2, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    if-eqz v2, :cond_2f

    .line 547
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    iget v3, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mColor:I

    invoke-interface {v2, v3}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->setTextColor(I)V

    .line 548
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->postInvalidate()V

    .line 551
    :cond_2f
    return-void
.end method


# virtual methods
.method protected generateContentView(Landroid/view/LayoutInflater;)Landroid/view/View;
    .registers 4
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InflateParams"
        }
    .end annotation

    .prologue
    .line 165
    sget v0, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_editor_content_text:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method protected generateOptionView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/ViewGroup;
    .registers 5
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 170
    sget v0, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_bottombar_panel_spot:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    return-object v0
.end method

.method public getIsChanged()Z
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 175
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v2, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getHighlightCount()I

    move-result v2

    if-lez v2, :cond_2b

    .line 176
    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v2, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    invoke-virtual {v2, v3}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getHighlightViewAt(I)Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    move-result-object v1

    .line 177
    .local v1, "hv":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    if-eqz v1, :cond_2b

    .line 178
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v2

    instance-of v2, v2, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    if-eqz v2, :cond_2b

    .line 179
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    .line 180
    .local v0, "editable":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;
    if-eqz v0, :cond_2b

    .line 182
    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->isTextHint()Z

    move-result v2

    if-eqz v2, :cond_2c

    .line 193
    .end local v0    # "editable":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;
    .end local v1    # "hv":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    :cond_2b
    :goto_2b
    return v3

    .line 185
    .restart local v0    # "editable":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;
    .restart local v1    # "hv":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    :cond_2c
    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    if-eqz v2, :cond_2b

    .line 188
    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-lez v2, :cond_3f

    const/4 v2, 0x1

    :goto_3d
    move v3, v2

    goto :goto_2b

    :cond_3f
    move v2, v3

    goto :goto_3d
.end method

.method public onActivate()V
    .registers 5

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 396
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onActivate()V

    .line 398
    new-array v0, v3, [Lcom/adobe/android/ui/widget/VibrationWidget;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    aput-object v1, v0, v2

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->disableHapticIsNecessary([Lcom/adobe/android/ui/widget/VibrationWidget;)V

    .line 400
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->config:Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    sget v1, Lcom/aviary/android/feather/sdk/R$dimen;->com_adobe_image_editor_text_default_size:I

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mDefaultTextSize:I

    .line 402
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->setOnDrawableEventListener(Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay$OnDrawableEventListener;)V

    .line 403
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    invoke-virtual {v0, v3}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->setScaleWithContent(Z)V

    .line 404
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    invoke-virtual {v0, v2}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->setForceSingleSelection(Z)V

    .line 406
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->requestLayout()V

    .line 408
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v0, p0}, Landroid/widget/EditText;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 410
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->contentReady()V

    .line 413
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->getHandler()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/TextPanel$2;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/panels/TextPanel$2;-><init>(Lcom/adobe/creativesdk/aviary/panels/TextPanel;)V

    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 420
    return-void
.end method

.method public onClick(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V
    .registers 3
    .param p1, "view"    # Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .prologue
    .line 334
    if-eqz p1, :cond_13

    .line 335
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v0

    instance-of v0, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    if-eqz v0, :cond_13

    .line 337
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->isFocused()Z

    move-result v0

    if-nez v0, :cond_13

    .line 338
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->beginEdit(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    .line 342
    :cond_13
    return-void
.end method

.method public onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V
    .registers 14
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "options"    # Landroid/os/Bundle;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongViewCast"
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    .line 347
    invoke-super {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V

    .line 349
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v6

    const-class v7, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    invoke-virtual {v6, v7}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    iput-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->config:Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    .line 351
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->config:Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    sget v7, Lcom/aviary/android/feather/sdk/R$array;->com_adobe_image_editor_text_colors:I

    invoke-virtual {v6, v7}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getIntArray(I)[I

    move-result-object v6

    iput-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mColors:[I

    .line 352
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->config:Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    sget v7, Lcom/aviary/android/feather/sdk/R$integer;->com_adobe_image_editor_text_color_selected:I

    invoke-virtual {v6, v7}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getInteger(I)I

    move-result v3

    .line 354
    .local v3, "mSelectedPosition":I
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->config:Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    sget v7, Lcom/aviary/android/feather/sdk/R$bool;->com_adobe_image_editor_draw_panels_use_palette:I

    invoke-virtual {v6, v7}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getBoolean(I)Z

    move-result v6

    if-eqz v6, :cond_76

    .line 355
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v6

    const-class v7, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;

    invoke-virtual {v6, v7}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;

    .line 356
    .local v4, "service":Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;
    if-eqz v4, :cond_76

    .line 357
    invoke-virtual {v4}, Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;->getImageInfo()Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;

    move-result-object v2

    .line 358
    .local v2, "imageInfo":Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;
    if-eqz v2, :cond_76

    .line 359
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->getPalette()Landroid/support/v7/graphics/Palette;

    move-result-object v6

    if-eqz v6, :cond_76

    .line 360
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;->getPalette()Landroid/support/v7/graphics/Palette;

    move-result-object v6

    invoke-virtual {v6}, Landroid/support/v7/graphics/Palette;->getSwatches()Ljava/util/List;

    move-result-object v5

    .line 361
    .local v5, "swatches":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/graphics/Palette$Swatch;>;"
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v6

    new-array v0, v6, [I

    .line 362
    .local v0, "colors":[I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_57
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v6

    if-ge v1, v6, :cond_6c

    .line 363
    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/support/v7/graphics/Palette$Swatch;

    invoke-virtual {v6}, Landroid/support/v7/graphics/Palette$Swatch;->getRgb()I

    move-result v6

    aput v6, v0, v1

    .line 362
    add-int/lit8 v1, v1, 0x1

    goto :goto_57

    .line 365
    :cond_6c
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mColors:[I

    invoke-static {v0, v6}, Lorg/apache/commons/lang3/ArrayUtils;->addAll([I[I)[I

    move-result-object v6

    iput-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mColors:[I

    .line 366
    array-length v6, v0

    add-int/2addr v3, v6

    .line 372
    .end local v0    # "colors":[I
    .end local v1    # "i":I
    .end local v2    # "imageInfo":Lcom/adobe/creativesdk/aviary/internal/utils/ImageInfo;
    .end local v4    # "service":Lcom/adobe/creativesdk/aviary/internal/services/LocalDataService;
    .end local v5    # "swatches":Ljava/util/List;, "Ljava/util/List<Landroid/support/v7/graphics/Palette$Swatch;>;"
    :cond_76
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mColors:[I

    aget v6, v6, v3

    iput v6, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mColor:I

    .line 374
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->config:Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    sget v7, Lcom/aviary/android/feather/sdk/R$string;->feather_acc_color:I

    invoke-virtual {v6, v7}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mColorContentDescription:Ljava/lang/String;

    .line 376
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v6

    sget v7, Lcom/aviary/android/feather/sdk/R$id;->gallery:I

    invoke-virtual {v6, v7}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/adobe/android/ui/widget/AdobeGalleryView;

    iput-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    .line 377
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v6, v3}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setDefaultPosition(I)V

    .line 378
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v6, v10}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setCallbackDuringFling(Z)V

    .line 379
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setAutoSelectChild(Z)V

    .line 380
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    new-instance v7, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$GalleryColorAdapter;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v8

    invoke-virtual {v8}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v8

    iget-object v9, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mColors:[I

    invoke-direct {v7, v8, v9}, Lcom/adobe/creativesdk/aviary/panels/DrawingPanel$GalleryColorAdapter;-><init>(Landroid/content/Context;[I)V

    invoke-virtual {v6, v7}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setAdapter(Landroid/widget/Adapter;)V

    .line 381
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v6, p0}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setOnItemsScrollListener(Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;)V

    .line 383
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->getContentView()Landroid/view/View;

    move-result-object v6

    sget v7, Lcom/aviary/android/feather/sdk/R$id;->text:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/EditText;

    iput-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mEditText:Landroid/widget/EditText;

    .line 385
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->getContentView()Landroid/view/View;

    move-result-object v6

    sget v7, Lcom/aviary/android/feather/sdk/R$id;->image:I

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    iput-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    .line 386
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    sget-object v7, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;->FIT_IF_BIGGER:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    invoke-virtual {v6, v7}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setDisplayType(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;)V

    .line 387
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v6, v10}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setDoubleTapEnabled(Z)V

    .line 389
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->createAndConfigurePreview()V

    .line 391
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mPreview:Landroid/graphics/Bitmap;

    const/4 v8, 0x0

    const/high16 v9, -0x40800000

    const/high16 v10, 0x41000000

    invoke-virtual {v6, v7, v8, v9, v10}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setImageBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;FF)V

    .line 392
    return-void
.end method

.method public onDeactivate()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 424
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->setOnDrawableEventListener(Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay$OnDrawableEventListener;)V

    .line 425
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mGallery:Lcom/adobe/android/ui/widget/AdobeGalleryView;

    invoke-virtual {v0, v1}, Lcom/adobe/android/ui/widget/AdobeGalleryView;->setOnItemsScrollListener(Lcom/adobe/android/ui/widget/AdobeGalleryView$OnItemsScrollListener;)V

    .line 426
    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->endEdit(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    .line 427
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onDeactivate()V

    .line 428
    return-void
.end method

.method public onDestroy()V
    .registers 2

    .prologue
    .line 432
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mCanvas:Landroid/graphics/Canvas;

    .line 433
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->clearOverlays()V

    .line 434
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onDestroy()V

    .line 435
    return-void
.end method

.method public onDown(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V
    .registers 2
    .param p1, "view"    # Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .prologue
    .line 491
    return-void
.end method

.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .registers 10
    .param p1, "v"    # Landroid/widget/TextView;
    .param p2, "actionId"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 556
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onEditorAction: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", event: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;)V

    .line 558
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mEditText:Landroid/widget/EditText;

    if-eqz v3, :cond_56

    .line 559
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mEditText:Landroid/widget/EditText;

    invoke-virtual {v3, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_56

    .line 560
    const/4 v3, 0x6

    if-ne p2, v3, :cond_56

    .line 561
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    .line 562
    .local v1, "image":Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getSelectedHighlightView()Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    move-result-object v3

    if-eqz v3, :cond_56

    .line 563
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getSelectedHighlightView()Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    move-result-object v0

    .line 564
    .local v0, "d":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v3

    instance-of v3, v3, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    if-eqz v3, :cond_56

    .line 565
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v2

    check-cast v2, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    .line 566
    .local v2, "text":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;
    invoke-interface {v2}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->isEditing()Z

    move-result v3

    if-eqz v3, :cond_56

    .line 568
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->endEdit(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    .line 576
    .end local v0    # "d":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    .end local v1    # "image":Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;
    .end local v2    # "text":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;
    :cond_56
    const/4 v3, 0x0

    return v3
.end method

.method public onFocusChange(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V
    .registers 5
    .param p1, "newFocus"    # Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    .param p2, "oldFocus"    # Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .prologue
    .line 497
    if-eqz p2, :cond_19

    .line 498
    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v1

    instance-of v1, v1, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    if-eqz v1, :cond_19

    .line 499
    invoke-virtual {p2}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    .line 500
    .local v0, "text":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;
    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->isEditing()Z

    move-result v1

    if-eqz v1, :cond_19

    .line 502
    invoke-direct {p0, p2}, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->endEdit(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    .line 507
    .end local v0    # "text":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;
    :cond_19
    if-eqz p1, :cond_2f

    .line 508
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v1

    instance-of v1, v1, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    if-eqz v1, :cond_2f

    .line 509
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    .line 510
    .restart local v0    # "text":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;
    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->getTextColor()I

    move-result v1

    iput v1, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mColor:I

    .line 513
    .end local v0    # "text":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;
    :cond_2f
    return-void
.end method

.method protected onGenerateResult()V
    .registers 4

    .prologue
    .line 517
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->onApplyCurrent()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v0

    .line 518
    .local v0, "actions":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    invoke-virtual {v1, v0}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setActionList(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V

    .line 519
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mToolAction:Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setToolAction(Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;)V

    .line 520
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    invoke-super {p0, v1}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onGenerateResult(Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;)V

    .line 521
    return-void
.end method

.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .registers 10
    .param p1, "v"    # Landroid/view/View;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 467
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v3, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getSelectedHighlightView()Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    move-result-object v2

    .line 468
    .local v2, "hv":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onKey: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 470
    if-eqz v2, :cond_54

    .line 472
    const/16 v3, 0x43

    if-eq p2, v3, :cond_29

    const/4 v3, 0x4

    if-ne p2, v3, :cond_54

    .line 474
    :cond_29
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v0

    .line 475
    .local v0, "content":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;
    instance-of v3, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    if-eqz v3, :cond_54

    move-object v1, v0

    .line 476
    check-cast v1, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    .line 478
    .local v1, "editable":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;
    invoke-interface {v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->isTextHint()Z

    move-result v3

    if-eqz v3, :cond_54

    invoke-interface {v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->isEditing()Z

    move-result v3

    if-eqz v3, :cond_54

    .line 479
    const-string v3, ""

    invoke-interface {v1, v3}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->setText(Ljava/lang/String;)V

    .line 480
    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->forceUpdate()Z

    move-result v3

    if-eqz v3, :cond_54

    .line 481
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getInvalidationRect()Landroid/graphics/Rect;

    move-result-object v4

    invoke-virtual {v3, v4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->invalidate(Landroid/graphics/Rect;)V

    .line 487
    .end local v0    # "content":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;
    .end local v1    # "editable":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;
    :cond_54
    const/4 v3, 0x0

    return v3
.end method

.method public onMove(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V
    .registers 3
    .param p1, "view"    # Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .prologue
    .line 525
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v0

    instance-of v0, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    if-eqz v0, :cond_17

    .line 526
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->isEditing()Z

    move-result v0

    if-eqz v0, :cond_17

    .line 527
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->endEdit(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    .line 530
    :cond_17
    return-void
.end method

.method public onScroll(Lcom/adobe/android/ui/widget/AdobeAdapterView;Landroid/view/View;IJ)V
    .registers 8
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/android/ui/widget/AdobeAdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 442
    .local p1, "parent":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<*>;"
    if-ltz p3, :cond_10

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mColors:[I

    array-length v1, v1

    if-ge p3, v1, :cond_10

    .line 443
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mColors:[I

    aget v0, v1, p3

    .line 444
    .local v0, "color":I
    iput v0, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mColor:I

    .line 445
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->updateCurrentHighlightColor()V

    .line 447
    .end local v0    # "color":I
    :cond_10
    return-void
.end method

.method public onScrollFinished(Lcom/adobe/android/ui/widget/AdobeAdapterView;Landroid/view/View;IJ)V
    .registers 9
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/android/ui/widget/AdobeAdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 451
    .local p1, "parent":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<*>;"
    if-ltz p3, :cond_1d

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mColors:[I

    array-length v1, v1

    if-ge p3, v1, :cond_1d

    .line 452
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mColors:[I

    aget v0, v1, p3

    .line 453
    .local v0, "color":I
    iput v0, p0, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->mColor:I

    .line 456
    :try_start_d
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getTracker()Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;

    move-result-object v1

    const-string v2, "text: colors_selected"

    invoke-virtual {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/tracking/AdobeImageAnalyticsTracker;->tagEvent(Ljava/lang/String;)V
    :try_end_1a
    .catch Ljava/lang/Throwable; {:try_start_d .. :try_end_1a} :catch_1e

    .line 460
    :goto_1a
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/TextPanel;->updateCurrentHighlightColor()V

    .line 462
    .end local v0    # "color":I
    :cond_1d
    return-void

    .line 457
    .restart local v0    # "color":I
    :catch_1e
    move-exception v1

    goto :goto_1a
.end method

.method public onScrollStarted(Lcom/adobe/android/ui/widget/AdobeAdapterView;Landroid/view/View;IJ)V
    .registers 6
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/adobe/android/ui/widget/AdobeAdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 438
    .local p1, "parent":Lcom/adobe/android/ui/widget/AdobeAdapterView;, "Lcom/adobe/android/ui/widget/AdobeAdapterView<*>;"
    return-void
.end method
