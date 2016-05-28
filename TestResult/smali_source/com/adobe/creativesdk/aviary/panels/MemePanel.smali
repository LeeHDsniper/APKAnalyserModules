.class public Lcom/adobe/creativesdk/aviary/panels/MemePanel;
.super Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;
.source "MemePanel.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/TextView$OnEditorActionListener;
.implements Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay$OnDrawableEventListener;
.implements Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/adobe/creativesdk/aviary/panels/MemePanel$MyTextWatcher;
    }
.end annotation


# instance fields
.field bottomHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

.field clearButtonBottom:Landroid/view/View;

.field clearButtonTop:Landroid/view/View;

.field editBottomButton:Lcom/adobe/android/ui/view/AdobeButton;

.field editBottomText:Landroid/widget/EditText;

.field editTopButton:Lcom/adobe/android/ui/view/AdobeButton;

.field editTopText:Landroid/widget/EditText;

.field fontName:Ljava/lang/String;

.field mCanvas:Landroid/graphics/Canvas;

.field private final mEditTextWatcher:Lcom/adobe/creativesdk/aviary/panels/MemePanel$MyTextWatcher;

.field mInputHandler:Landroid/os/Handler;

.field mInputManager:Landroid/view/inputmethod/InputMethodManager;

.field mInputReceiver:Landroid/os/ResultReceiver;

.field mTextColor:I

.field mTextStrokeColor:I

.field mTextStrokeEnabled:Z

.field final mToolAction:Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO",
            "<[",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field mTypeface:Landroid/graphics/Typeface;

.field mTypefaceSourceDir:Ljava/lang/String;

.field paddingBottom:I

.field paddingTop:I

.field topHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;


# direct methods
.method public constructor <init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V
    .registers 9
    .param p1, "context"    # Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;
    .param p2, "entry"    # Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;

    .prologue
    const/16 v1, 0x10

    const/4 v5, 0x1

    .line 77
    invoke-direct {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;-><init>(Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;Lcom/adobe/creativesdk/aviary/internal/content/ToolEntry;)V

    .line 67
    iput v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->paddingTop:I

    .line 68
    iput v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->paddingBottom:I

    .line 69
    const/4 v1, -0x1

    iput v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mTextColor:I

    .line 70
    const/high16 v1, -0x1000000

    iput v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mTextStrokeColor:I

    .line 71
    iput-boolean v5, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mTextStrokeEnabled:Z

    .line 73
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mInputHandler:Landroid/os/Handler;

    .line 74
    new-instance v1, Landroid/os/ResultReceiver;

    iget-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mInputHandler:Landroid/os/Handler;

    invoke-direct {v1, v2}, Landroid/os/ResultReceiver;-><init>(Landroid/os/Handler;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mInputReceiver:Landroid/os/ResultReceiver;

    .line 413
    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/MemePanel$2;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/panels/MemePanel$2;-><init>(Lcom/adobe/creativesdk/aviary/panels/MemePanel;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mEditTextWatcher:Lcom/adobe/creativesdk/aviary/panels/MemePanel$MyTextWatcher;

    .line 79
    new-instance v1, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, ""

    aput-object v4, v2, v3

    const-string v3, ""

    aput-object v3, v2, v5

    invoke-direct {v1, v2}, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mToolAction:Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    .line 81
    const-class v1, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    invoke-virtual {p1, v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;

    .line 82
    .local v0, "config":Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;
    if-eqz v0, :cond_67

    .line 83
    sget v1, Lcom/aviary/android/feather/sdk/R$string;->com_adobe_image_editor_meme_font:I

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->fontName:Ljava/lang/String;

    .line 84
    sget v1, Lcom/aviary/android/feather/sdk/R$color;->com_adobe_image_editor_meme_text_color:I

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getColor(I)I

    move-result v1

    iput v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mTextColor:I

    .line 85
    sget v1, Lcom/aviary/android/feather/sdk/R$color;->com_adobe_image_editor_meme_stroke_color:I

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getColor(I)I

    move-result v1

    iput v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mTextStrokeColor:I

    .line 86
    sget v1, Lcom/aviary/android/feather/sdk/R$bool;->com_adobe_image_editor_meme_stroke_enabled:I

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/services/ConfigService;->getBoolean(I)Z

    move-result v1

    iput-boolean v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mTextStrokeEnabled:Z

    .line 88
    :cond_67
    return-void
.end method

.method static synthetic access$000(Lcom/adobe/creativesdk/aviary/panels/MemePanel;)V
    .registers 1
    .param p0, "x0"    # Lcom/adobe/creativesdk/aviary/panels/MemePanel;

    .prologue
    .line 56
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->checkIsChanged()V

    return-void
.end method

.method private beginEditText(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V
    .registers 8
    .param p1, "view"    # Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .prologue
    const/4 v5, 0x0

    .line 557
    const/4 v0, 0x0

    .line 559
    .local v0, "editText":Landroid/widget/EditText;
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->topHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    if-ne p1, v3, :cond_7a

    .line 560
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->editTopText:Landroid/widget/EditText;

    .line 565
    :cond_8
    :goto_8
    if-eqz v0, :cond_79

    .line 566
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mEditTextWatcher:Lcom/adobe/creativesdk/aviary/panels/MemePanel$MyTextWatcher;

    const/4 v4, 0x0

    iput-object v4, v3, Lcom/adobe/creativesdk/aviary/panels/MemePanel$MyTextWatcher;->view:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .line 567
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mEditTextWatcher:Lcom/adobe/creativesdk/aviary/panels/MemePanel$MyTextWatcher;

    invoke-virtual {v0, v3}, Landroid/widget/EditText;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 569
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    .line 570
    .local v1, "editable":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;
    invoke-interface {v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 571
    .local v2, "oldText":Ljava/lang/String;
    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 572
    invoke-virtual {v0}, Landroid/widget/EditText;->length()I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/widget/EditText;->setSelection(I)V

    .line 573
    const/4 v3, 0x6

    invoke-virtual {v0, v3}, Landroid/widget/EditText;->setImeOptions(I)V

    .line 574
    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocusFromTouch()Z

    .line 576
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mInputManager:Landroid/view/inputmethod/InputMethodManager;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mInputReceiver:Landroid/os/ResultReceiver;

    invoke-virtual {v3, v0, v5, v4}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;ILandroid/os/ResultReceiver;)Z

    move-result v3

    if-nez v3, :cond_41

    .line 577
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mInputManager:Landroid/view/inputmethod/InputMethodManager;

    const/4 v4, 0x2

    invoke-virtual {v3, v4, v5}, Landroid/view/inputmethod/InputMethodManager;->toggleSoftInput(II)V

    .line 581
    :cond_41
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mEditTextWatcher:Lcom/adobe/creativesdk/aviary/panels/MemePanel$MyTextWatcher;

    iput-object p1, v3, Lcom/adobe/creativesdk/aviary/panels/MemePanel$MyTextWatcher;->view:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .line 582
    invoke-virtual {v0, p0}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 583
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mEditTextWatcher:Lcom/adobe/creativesdk/aviary/panels/MemePanel$MyTextWatcher;

    invoke-virtual {v0, v3}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 585
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v3, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    invoke-virtual {v3, p1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->setSelectedHighlightView(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    .line 586
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v3

    check-cast v3, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v4

    check-cast v4, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    invoke-interface {v4}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->setText(Ljava/lang/CharSequence;)V

    .line 588
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->forceUpdate()Z

    move-result v3

    if-eqz v3, :cond_76

    .line 589
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getInvalidationRect()Landroid/graphics/Rect;

    move-result-object v4

    invoke-virtual {v3, v4}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->invalidate(Landroid/graphics/Rect;)V

    .line 592
    :cond_76
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->checkIsChanged()V

    .line 594
    .end local v1    # "editable":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;
    .end local v2    # "oldText":Ljava/lang/String;
    :cond_79
    return-void

    .line 561
    :cond_7a
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->bottomHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    if-ne p1, v3, :cond_8

    .line 562
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->editBottomText:Landroid/widget/EditText;

    goto :goto_8
.end method

.method private beginEditView(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V
    .registers 4
    .param p1, "hv"    # Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .prologue
    .line 481
    if-nez p1, :cond_3

    .line 498
    :goto_2
    return-void

    .line 485
    :cond_3
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    .line 487
    .local v0, "text":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->topHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    if-ne p1, v1, :cond_1f

    .line 488
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->bottomHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->endEditView(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    .line 493
    :goto_12
    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->isEditing()Z

    move-result v1

    if-nez v1, :cond_1b

    .line 494
    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->beginEdit()V

    .line 497
    :cond_1b
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->beginEditText(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    goto :goto_2

    .line 490
    :cond_1f
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->topHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->endEditView(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    goto :goto_12
.end method

.method private checkIsChanged()V
    .registers 4

    .prologue
    const/4 v1, 0x1

    .line 514
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->topHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->checkIsChanged(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)Z

    move-result v0

    if-eqz v0, :cond_29

    .line 515
    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->setIsChanged(Z)V

    .line 522
    :goto_c
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "isChanged?: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->getIsChanged()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->log(Ljava/lang/String;)V

    .line 523
    return-void

    .line 516
    :cond_29
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->bottomHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->checkIsChanged(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)Z

    move-result v0

    if-eqz v0, :cond_35

    .line 517
    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->setIsChanged(Z)V

    goto :goto_c

    .line 519
    :cond_35
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->setIsChanged(Z)V

    goto :goto_c
.end method

.method private checkIsChanged(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)Z
    .registers 5
    .param p1, "view"    # Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .prologue
    .line 526
    if-eqz p1, :cond_18

    .line 527
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    .line 528
    .local v0, "editable":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;
    if-eqz v0, :cond_18

    .line 529
    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    .line 530
    .local v1, "text":Ljava/lang/CharSequence;
    if-eqz v1, :cond_18

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-lez v2, :cond_18

    .line 531
    const/4 v2, 0x1

    .line 535
    .end local v0    # "editable":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;
    .end local v1    # "text":Ljava/lang/CharSequence;
    :goto_17
    return v2

    :cond_18
    const/4 v2, 0x0

    goto :goto_17
.end method

.method private clearEditView(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V
    .registers 5
    .param p1, "hv"    # Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .prologue
    .line 501
    if-eqz p1, :cond_22

    .line 502
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;

    .line 503
    .local v0, "text":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;
    const-string v1, ""

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->setText(Ljava/lang/String;)V

    .line 504
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->invalidateSelf()V

    .line 505
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->forceUpdate()Z

    move-result v1

    if-eqz v1, :cond_1f

    .line 506
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getInvalidationRect()Landroid/graphics/Rect;

    move-result-object v2

    invoke-virtual {v1, v2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->invalidate(Landroid/graphics/Rect;)V

    .line 509
    :cond_1f
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->checkIsChanged()V

    .line 511
    .end local v0    # "text":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;
    :cond_22
    return-void
.end method

.method private createAndConfigurePreview()V
    .registers 3

    .prologue
    .line 291
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mPreview:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_14

    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_14

    .line 292
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 293
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mPreview:Landroid/graphics/Bitmap;

    .line 296
    :cond_14
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/adobe/creativesdk/aviary/internal/utils/BitmapUtils;->copy(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mPreview:Landroid/graphics/Bitmap;

    .line 297
    new-instance v0, Landroid/graphics/Canvas;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mCanvas:Landroid/graphics/Canvas;

    .line 298
    return-void
.end method

.method private createTypeFace()V
    .registers 5

    .prologue
    .line 622
    :try_start_0
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->fontName:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/adobe/android/ui/utils/TypefaceUtils;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v2

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mTypeface:Landroid/graphics/Typeface;

    .line 624
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v2

    invoke-virtual {v2}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/adobe/creativesdk/aviary/internal/utils/PackageManagerUtils;->getApplicationInfo(Landroid/content/Context;)Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    .line 625
    .local v1, "info":Landroid/content/pm/ApplicationInfo;
    if-eqz v1, :cond_26

    .line 626
    iget-object v2, v1, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mTypefaceSourceDir:Ljava/lang/String;
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_26} :catch_27

    .line 632
    .end local v1    # "info":Landroid/content/pm/ApplicationInfo;
    :cond_26
    :goto_26
    return-void

    .line 629
    :catch_27
    move-exception v0

    .line 630
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    iput-object v2, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mTypeface:Landroid/graphics/Typeface;

    goto :goto_26
.end method

.method private endEditText(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V
    .registers 8
    .param p1, "view"    # Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 598
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->logger:Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;

    const-string v2, "endEditText"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p1, v3, v4

    invoke-interface {v1, v2, v3}, Lcom/adobe/creativesdk/aviary/log/LoggerFactory$Logger;->info(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 600
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mEditTextWatcher:Lcom/adobe/creativesdk/aviary/panels/MemePanel$MyTextWatcher;

    iput-object v5, v1, Lcom/adobe/creativesdk/aviary/panels/MemePanel$MyTextWatcher;->view:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .line 601
    const/4 v0, 0x0

    .line 603
    .local v0, "editText":Landroid/widget/EditText;
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->topHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    if-ne p1, v1, :cond_38

    .line 604
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->editTopText:Landroid/widget/EditText;

    .line 609
    :cond_19
    :goto_19
    if-eqz v0, :cond_37

    .line 610
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mEditTextWatcher:Lcom/adobe/creativesdk/aviary/panels/MemePanel$MyTextWatcher;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 611
    invoke-virtual {v0, v5}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 613
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mInputManager:Landroid/view/inputmethod/InputMethodManager;

    invoke-virtual {v1, v0}, Landroid/view/inputmethod/InputMethodManager;->isActive(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_34

    .line 614
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mInputManager:Landroid/view/inputmethod/InputMethodManager;

    invoke-virtual {v0}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v2

    invoke-virtual {v1, v2, v4}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 616
    :cond_34
    invoke-virtual {v0}, Landroid/widget/EditText;->clearFocus()V

    .line 618
    :cond_37
    return-void

    .line 605
    :cond_38
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->bottomHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    if-ne p1, v1, :cond_19

    .line 606
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->editBottomText:Landroid/widget/EditText;

    goto :goto_19
.end method

.method private endEditView(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V
    .registers 8
    .param p1, "hv"    # Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .prologue
    const/4 v3, 0x4

    const/4 v2, 0x0

    .line 459
    if-nez p1, :cond_5

    .line 478
    :cond_4
    :goto_4
    return-void

    .line 463
    :cond_5
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    .line 465
    .local v0, "text":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;
    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->isEditing()Z

    move-result v4

    if-eqz v4, :cond_17

    .line 466
    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->endEdit()V

    .line 467
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->endEditText(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    .line 470
    :cond_17
    invoke-interface {v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    .line 471
    .local v1, "value":Ljava/lang/CharSequence;
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->topHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-virtual {p1, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_38

    .line 472
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->editTopButton:Lcom/adobe/android/ui/view/AdobeButton;

    invoke-virtual {v4, v1}, Lcom/adobe/android/ui/view/AdobeButton;->setText(Ljava/lang/CharSequence;)V

    .line 473
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->clearButtonTop:Landroid/view/View;

    if-eqz v1, :cond_36

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v5

    if-lez v5, :cond_36

    :goto_32
    invoke-virtual {v4, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_4

    :cond_36
    move v2, v3

    goto :goto_32

    .line 474
    :cond_38
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->bottomHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-virtual {p1, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 475
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->editBottomButton:Lcom/adobe/android/ui/view/AdobeButton;

    invoke-virtual {v4, v1}, Lcom/adobe/android/ui/view/AdobeButton;->setText(Ljava/lang/CharSequence;)V

    .line 476
    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->clearButtonBottom:Landroid/view/View;

    if-eqz v1, :cond_53

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v5

    if-lez v5, :cond_53

    :goto_4f
    invoke-virtual {v4, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_4

    :cond_53
    move v2, v3

    goto :goto_4f
.end method

.method private flattenText(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;Lcom/adobe/creativesdk/aviary/internal/filters/MemeFilter;)V
    .registers 16
    .param p1, "hv"    # Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    .param p2, "filter"    # Lcom/adobe/creativesdk/aviary/internal/filters/MemeFilter;

    .prologue
    const/4 v12, 0x1

    const/4 v9, 0x0

    .line 248
    if-eqz p1, :cond_a2

    .line 249
    invoke-virtual {p1, v12}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->setHidden(Z)V

    .line 250
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v7}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v7

    invoke-static {v7}, Lcom/adobe/creativesdk/aviary/internal/utils/MatrixUtils;->getScale(Landroid/graphics/Matrix;)[F

    move-result-object v7

    aget v5, v7, v9

    .line 252
    .local v5, "scale":F
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v7}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    .line 253
    .local v6, "width":I
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v7}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    .line 255
    .local v2, "height":I
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getCropRectF()Landroid/graphics/RectF;

    move-result-object v0

    .line 256
    .local v0, "cropRect":Landroid/graphics/RectF;
    new-instance v3, Landroid/graphics/Rect;

    iget v7, v0, Landroid/graphics/RectF;->left:F

    float-to-int v7, v7

    iget v8, v0, Landroid/graphics/RectF;->top:F

    float-to-int v8, v8

    iget v10, v0, Landroid/graphics/RectF;->right:F

    float-to-int v10, v10

    iget v11, v0, Landroid/graphics/RectF;->bottom:F

    float-to-int v11, v11

    invoke-direct {v3, v7, v8, v10, v11}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 257
    .local v3, "rect":Landroid/graphics/Rect;
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;

    .line 259
    .local v1, "editable":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v7, v12}, Landroid/graphics/Canvas;->save(I)I

    move-result v4

    .line 262
    .local v4, "saveCount":I
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->endEdit()V

    .line 263
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->invalidateSelf()V

    .line 265
    int-to-float v7, v6

    int-to-float v8, v2

    invoke-virtual {v1, v7, v8}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->setContentSize(FF)V

    .line 266
    iget v7, v3, Landroid/graphics/Rect;->left:I

    iget v8, v3, Landroid/graphics/Rect;->top:I

    iget v10, v3, Landroid/graphics/Rect;->right:I

    iget v11, v3, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v1, v7, v8, v10, v11}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->setBounds(IIII)V

    .line 267
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v1, v7}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 269
    invoke-virtual {p2, v6, v2}, Lcom/adobe/creativesdk/aviary/internal/filters/MemeFilter;->setPreviewSize(II)V

    .line 270
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->getTextColor()I

    move-result v7

    invoke-virtual {p2, v7}, Lcom/adobe/creativesdk/aviary/internal/filters/MemeFilter;->setFillColor(I)V

    .line 271
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->getStrokeEnabled()Z

    move-result v7

    if-eqz v7, :cond_a8

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->getTextStrokeColor()I

    move-result v7

    :goto_6f
    invoke-virtual {p2, v7}, Lcom/adobe/creativesdk/aviary/internal/filters/MemeFilter;->setStrokeColor(I)V

    .line 272
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->getDefaultTextSize()F

    move-result v7

    div-float/2addr v7, v5

    float-to-double v10, v7

    invoke-virtual {p2, v10, v11}, Lcom/adobe/creativesdk/aviary/internal/filters/MemeFilter;->setTextSize(D)V

    .line 274
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->topHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    if-ne v7, p1, :cond_aa

    .line 275
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->getText()Ljava/lang/CharSequence;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {p2, v7}, Lcom/adobe/creativesdk/aviary/internal/filters/MemeFilter;->setTopText(Ljava/lang/String;)V

    .line 276
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mToolAction:Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    invoke-virtual {v7}, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/String;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->getText()Ljava/lang/CharSequence;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    aput-object v8, v7, v9

    .line 282
    :cond_98
    :goto_98
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v7, v4}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 283
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v7}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->invalidate()V

    .line 286
    .end local v0    # "cropRect":Landroid/graphics/RectF;
    .end local v1    # "editable":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;
    .end local v2    # "height":I
    .end local v3    # "rect":Landroid/graphics/Rect;
    .end local v4    # "saveCount":I
    .end local v5    # "scale":F
    .end local v6    # "width":I
    :cond_a2
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {p0, v7, v9, v9}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->onPreviewChanged(Landroid/graphics/Bitmap;ZZ)V

    .line 287
    return-void

    .restart local v0    # "cropRect":Landroid/graphics/RectF;
    .restart local v1    # "editable":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;
    .restart local v2    # "height":I
    .restart local v3    # "rect":Landroid/graphics/Rect;
    .restart local v4    # "saveCount":I
    .restart local v5    # "scale":F
    .restart local v6    # "width":I
    :cond_a8
    move v7, v9

    .line 271
    goto :goto_6f

    .line 277
    :cond_aa
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->bottomHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    if-ne p1, v7, :cond_98

    .line 278
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->getText()Ljava/lang/CharSequence;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {p2, v7}, Lcom/adobe/creativesdk/aviary/internal/filters/MemeFilter;->setBottomText(Ljava/lang/String;)V

    .line 279
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mToolAction:Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    invoke-virtual {v7}, Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/String;

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->getText()Ljava/lang/CharSequence;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    aput-object v8, v7, v12

    goto :goto_98
.end method

.method public static getMatrixValues(Landroid/graphics/Matrix;)[F
    .registers 3
    .param p0, "m"    # Landroid/graphics/Matrix;

    .prologue
    .line 337
    const/16 v1, 0x9

    new-array v0, v1, [F

    .line 338
    .local v0, "values":[F
    invoke-virtual {p0, v0}, Landroid/graphics/Matrix;->getValues([F)V

    .line 339
    return-object v0
.end method

.method private onAddBottomText()V
    .registers 15

    .prologue
    .line 376
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v7, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    .line 378
    .local v7, "image":Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;
    invoke-virtual {v7}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getBitmapRect()Landroid/graphics/RectF;

    move-result-object v11

    .line 379
    .local v11, "rect":Landroid/graphics/RectF;
    invoke-virtual {v11}, Landroid/graphics/RectF;->width()F

    move-result v0

    invoke-virtual {v11}, Landroid/graphics/RectF;->height()F

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    const/high16 v1, 0x40e00000

    div-float/2addr v0, v1

    float-to-int v13, v0

    .line 381
    .local v13, "textSize":I
    new-instance v12, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;

    const-string v0, ""

    int-to-float v1, v13

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mTypeface:Landroid/graphics/Typeface;

    const/4 v5, 0x0

    invoke-direct {v12, v0, v1, v3, v5}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;-><init>(Ljava/lang/String;FLandroid/graphics/Typeface;Z)V

    .line 382
    .local v12, "text":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;
    iget v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mTextColor:I

    invoke-virtual {v12, v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->setTextColor(I)V

    .line 383
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mTextStrokeEnabled:Z

    invoke-virtual {v12, v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->setStrokeEnabled(Z)V

    .line 384
    iget v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mTextStrokeColor:I

    invoke-virtual {v12, v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->setStrokeColor(I)V

    .line 385
    invoke-virtual {v11}, Landroid/graphics/RectF;->width()F

    move-result v0

    invoke-virtual {v11}, Landroid/graphics/RectF;->height()F

    move-result v1

    invoke-virtual {v12, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->setContentSize(FF)V

    .line 387
    new-instance v9, Landroid/graphics/Paint$FontMetrics;

    invoke-direct {v9}, Landroid/graphics/Paint$FontMetrics;-><init>()V

    .line 388
    .local v9, "metrics":Landroid/graphics/Paint$FontMetrics;
    invoke-virtual {v12, v9}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->getFontMetrics(Landroid/graphics/Paint$FontMetrics;)F

    .line 390
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-virtual {v7}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getOverlayStyleId()I

    move-result v1

    invoke-direct {v0, v7, v1, v12}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;-><init>(Lit/sephiroth/android/library/imagezoom/ImageViewTouch;ILcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->bottomHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .line 391
    invoke-virtual {v7}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getImageViewMatrix()Landroid/graphics/Matrix;

    move-result-object v2

    .line 393
    .local v2, "mImageMatrix":Landroid/graphics/Matrix;
    invoke-virtual {v12}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->getIntrinsicHeight()I

    move-result v6

    .line 395
    .local v6, "cropHeight":I
    new-instance v8, Landroid/graphics/Matrix;

    invoke-direct {v8, v2}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    .line 396
    .local v8, "matrix":Landroid/graphics/Matrix;
    invoke-virtual {v8, v8}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 398
    const/4 v0, 0x4

    new-array v10, v0, [F

    const/4 v0, 0x0

    iget v1, v11, Landroid/graphics/RectF;->left:F

    aput v1, v10, v0

    const/4 v0, 0x1

    iget v1, v11, Landroid/graphics/RectF;->bottom:F

    int-to-float v3, v6

    sub-float/2addr v1, v3

    iget v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->paddingBottom:I

    int-to-float v3, v3

    sub-float/2addr v1, v3

    aput v1, v10, v0

    const/4 v0, 0x2

    iget v1, v11, Landroid/graphics/RectF;->left:F

    .line 399
    invoke-virtual {v11}, Landroid/graphics/RectF;->width()F

    move-result v3

    add-float/2addr v1, v3

    aput v1, v10, v0

    const/4 v0, 0x3

    iget v1, v11, Landroid/graphics/RectF;->bottom:F

    iget v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->paddingBottom:I

    int-to-float v3, v3

    sub-float/2addr v1, v3

    aput v1, v10, v0

    .line 400
    .local v10, "pts":[F
    invoke-static {v8, v10}, Lcom/adobe/creativesdk/aviary/internal/utils/MatrixUtils;->mapPoints(Landroid/graphics/Matrix;[F)V

    .line 402
    new-instance v4, Landroid/graphics/RectF;

    const/4 v0, 0x0

    aget v0, v10, v0

    const/4 v1, 0x1

    aget v1, v10, v1

    const/4 v3, 0x2

    aget v3, v10, v3

    const/4 v5, 0x3

    aget v5, v10, v5

    invoke-direct {v4, v0, v1, v3, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 404
    .local v4, "cropRect":Landroid/graphics/RectF;
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->bottomHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;->Bottom:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->setAlignModeV(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;)V

    .line 405
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->bottomHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    const/4 v3, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->setup(Landroid/content/Context;Landroid/graphics/Matrix;Landroid/graphics/Rect;Landroid/graphics/RectF;Z)V

    .line 406
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->bottomHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-virtual {v7, v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->addHighlightView(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)Z

    .line 407
    return-void
.end method

.method private onAddTopText()V
    .registers 14

    .prologue
    .line 344
    iget-object v7, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v7, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    .line 346
    .local v7, "image":Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;
    invoke-virtual {v7}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getBitmapRect()Landroid/graphics/RectF;

    move-result-object v10

    .line 348
    .local v10, "rect":Landroid/graphics/RectF;
    invoke-virtual {v10}, Landroid/graphics/RectF;->width()F

    move-result v0

    invoke-virtual {v10}, Landroid/graphics/RectF;->height()F

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    const/high16 v1, 0x40e00000

    div-float/2addr v0, v1

    float-to-int v12, v0

    .line 350
    .local v12, "textSize":I
    new-instance v11, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;

    const-string v0, ""

    int-to-float v1, v12

    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mTypeface:Landroid/graphics/Typeface;

    const/4 v5, 0x1

    invoke-direct {v11, v0, v1, v3, v5}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;-><init>(Ljava/lang/String;FLandroid/graphics/Typeface;Z)V

    .line 351
    .local v11, "text":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;
    iget v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mTextColor:I

    invoke-virtual {v11, v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->setTextColor(I)V

    .line 352
    iget-boolean v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mTextStrokeEnabled:Z

    invoke-virtual {v11, v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->setStrokeEnabled(Z)V

    .line 353
    iget v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mTextStrokeColor:I

    invoke-virtual {v11, v0}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->setStrokeColor(I)V

    .line 354
    invoke-virtual {v10}, Landroid/graphics/RectF;->width()F

    move-result v0

    invoke-virtual {v10}, Landroid/graphics/RectF;->height()F

    move-result v1

    invoke-virtual {v11, v0, v1}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->setContentSize(FF)V

    .line 356
    new-instance v0, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-virtual {v7}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getOverlayStyleId()I

    move-result v1

    invoke-direct {v0, v7, v1, v11}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;-><init>(Lit/sephiroth/android/library/imagezoom/ImageViewTouch;ILcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;)V

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->topHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .line 357
    invoke-virtual {v7}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getImageViewMatrix()Landroid/graphics/Matrix;

    move-result-object v2

    .line 359
    .local v2, "mImageMatrix":Landroid/graphics/Matrix;
    invoke-virtual {v11}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->getIntrinsicHeight()I

    move-result v6

    .line 361
    .local v6, "cropHeight":I
    new-instance v8, Landroid/graphics/Matrix;

    invoke-direct {v8, v2}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    .line 362
    .local v8, "matrix":Landroid/graphics/Matrix;
    invoke-virtual {v8, v8}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 364
    const/4 v0, 0x4

    new-array v9, v0, [F

    const/4 v0, 0x0

    iget v1, v10, Landroid/graphics/RectF;->left:F

    aput v1, v9, v0

    const/4 v0, 0x1

    iget v1, v10, Landroid/graphics/RectF;->top:F

    iget v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->paddingTop:I

    int-to-float v3, v3

    add-float/2addr v1, v3

    aput v1, v9, v0

    const/4 v0, 0x2

    iget v1, v10, Landroid/graphics/RectF;->right:F

    aput v1, v9, v0

    const/4 v0, 0x3

    iget v1, v10, Landroid/graphics/RectF;->top:F

    int-to-float v3, v6

    add-float/2addr v1, v3

    iget v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->paddingTop:I

    int-to-float v3, v3

    add-float/2addr v1, v3

    aput v1, v9, v0

    .line 365
    .local v9, "pts":[F
    invoke-static {v8, v9}, Lcom/adobe/creativesdk/aviary/internal/utils/MatrixUtils;->mapPoints(Landroid/graphics/Matrix;[F)V

    .line 367
    new-instance v4, Landroid/graphics/RectF;

    const/4 v0, 0x0

    aget v0, v9, v0

    const/4 v1, 0x1

    aget v1, v9, v1

    const/4 v3, 0x2

    aget v3, v9, v3

    const/4 v5, 0x3

    aget v5, v9, v5

    invoke-direct {v4, v0, v1, v3, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 369
    .local v4, "cropRect":Landroid/graphics/RectF;
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->topHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    sget-object v1, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;->Top:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->setAlignModeV(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView$AlignModeV;)V

    .line 370
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->topHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    const/4 v3, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->setup(Landroid/content/Context;Landroid/graphics/Matrix;Landroid/graphics/Rect;Landroid/graphics/RectF;Z)V

    .line 372
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->topHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-virtual {v7, v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->addHighlightView(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)Z

    .line 373
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
    .line 191
    sget v0, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_editor_content_meme:I

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
    .line 196
    sget v0, Lcom/aviary/android/feather/sdk/R$layout;->com_adobe_image_bottombar_panel_meme:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    return-object v0
.end method

.method public onActivate()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 133
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onActivate()V

    .line 135
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->createTypeFace()V

    .line 137
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    invoke-virtual {v0, p0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->setOnDrawableEventListener(Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay$OnDrawableEventListener;)V

    .line 138
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v0, p0}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setOnLayoutChangeListener(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$OnLayoutChangeListener;)V

    .line 140
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->getContext()Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/internal/AdobeImageEditorController;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "input_method"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mInputManager:Landroid/view/inputmethod/InputMethodManager;

    .line 141
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->editTopButton:Lcom/adobe/android/ui/view/AdobeButton;

    invoke-virtual {v0, p0}, Lcom/adobe/android/ui/view/AdobeButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 142
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->editBottomButton:Lcom/adobe/android/ui/view/AdobeButton;

    invoke-virtual {v0, p0}, Lcom/adobe/android/ui/view/AdobeButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 144
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->editTopText:Landroid/widget/EditText;

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setVisibility(I)V

    .line 145
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->editBottomText:Landroid/widget/EditText;

    invoke-virtual {v0, v2}, Landroid/widget/EditText;->setVisibility(I)V

    .line 146
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->editTopText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 147
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->editBottomText:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 149
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->clearButtonTop:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 150
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->clearButtonBottom:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 152
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->getContentView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 153
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->contentReady()V

    .line 154
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 302
    if-nez p1, :cond_3

    .line 326
    :cond_2
    :goto_2
    return-void

    .line 306
    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    .line 308
    .local v0, "id":I
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->editTopButton:Lcom/adobe/android/ui/view/AdobeButton;

    invoke-virtual {v1}, Lcom/adobe/android/ui/view/AdobeButton;->getId()I

    move-result v1

    if-ne v0, v1, :cond_1c

    .line 309
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->topHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    if-nez v1, :cond_16

    .line 310
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->onAddTopText()V

    .line 312
    :cond_16
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->topHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->onTopClick(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    goto :goto_2

    .line 314
    :cond_1c
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->editBottomButton:Lcom/adobe/android/ui/view/AdobeButton;

    invoke-virtual {v1}, Lcom/adobe/android/ui/view/AdobeButton;->getId()I

    move-result v1

    if-ne v0, v1, :cond_31

    .line 315
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->bottomHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    if-nez v1, :cond_2b

    .line 316
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->onAddBottomText()V

    .line 318
    :cond_2b
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->bottomHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->onTopClick(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    goto :goto_2

    .line 319
    :cond_31
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->clearButtonTop:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v1

    if-ne v0, v1, :cond_44

    .line 320
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->topHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->clearEditView(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    .line 321
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->topHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->endEditView(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    goto :goto_2

    .line 322
    :cond_44
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->clearButtonBottom:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v1

    if-ne v0, v1, :cond_2

    .line 323
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->bottomHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->clearEditView(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    .line 324
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->bottomHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-direct {p0, v1}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->endEditView(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    goto :goto_2
.end method

.method public onClick(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V
    .registers 3
    .param p1, "view"    # Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .prologue
    .line 548
    if-eqz p1, :cond_d

    .line 549
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v0

    instance-of v0, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    if-eqz v0, :cond_d

    .line 550
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->beginEditView(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    .line 554
    :cond_d
    return-void
.end method

.method public onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V
    .registers 7
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
    .param p2, "options"    # Landroid/os/Bundle;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongViewCast"
        }
    .end annotation

    .prologue
    const/high16 v3, -0x40800000

    const/4 v2, 0x0

    .line 93
    invoke-super {p0, p1, p2}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onCreate(Landroid/graphics/Bitmap;Landroid/os/Bundle;)V

    .line 95
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$id;->button1:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/adobe/android/ui/view/AdobeButton;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->editTopButton:Lcom/adobe/android/ui/view/AdobeButton;

    .line 96
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$id;->button2:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/adobe/android/ui/view/AdobeButton;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->editBottomButton:Lcom/adobe/android/ui/view/AdobeButton;

    .line 98
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->getContentView()Landroid/view/View;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$id;->image:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    .line 99
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->getContentView()Landroid/view/View;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$id;->invisible_text_1:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->editTopText:Landroid/widget/EditText;

    .line 100
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->getContentView()Landroid/view/View;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$id;->invisible_text_2:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->editBottomText:Landroid/widget/EditText;

    .line 102
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$id;->clear_button1:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->clearButtonTop:Landroid/view/View;

    .line 103
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->getOptionView()Landroid/view/ViewGroup;

    move-result-object v0

    sget v1, Lcom/aviary/android/feather/sdk/R$id;->clear_button2:I

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->clearButtonBottom:Landroid/view/View;

    .line 105
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    sget-object v1, Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;->FIT_TO_SCREEN:Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;

    invoke-virtual {v0, v1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setDisplayType(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$DisplayType;)V

    .line 106
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v0, v2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setDoubleTapEnabled(Z)V

    .line 107
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v0, v2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setScaleEnabled(Z)V

    .line 108
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v0, v2}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setScrollEnabled(Z)V

    .line 110
    invoke-direct {p0}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->createAndConfigurePreview()V

    .line 112
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    new-instance v1, Lcom/adobe/creativesdk/aviary/panels/MemePanel$1;

    invoke-direct {v1, p0}, Lcom/adobe/creativesdk/aviary/panels/MemePanel$1;-><init>(Lcom/adobe/creativesdk/aviary/panels/MemePanel;)V

    invoke-virtual {v0, v1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setOnDrawableChangedListener(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$OnDrawableChangeListener;)V

    .line 127
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mPreview:Landroid/graphics/Bitmap;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v3, v3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setImageBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;FF)V

    .line 129
    return-void
.end method

.method public onDeactivate()V
    .registers 4

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 158
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onDeactivate()V

    .line 160
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->topHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->endEditView(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    .line 161
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->bottomHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->endEditView(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    .line 163
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    invoke-virtual {v0, v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->setOnDrawableEventListener(Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay$OnDrawableEventListener;)V

    .line 164
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v0, v1}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->setOnLayoutChangeListener(Lit/sephiroth/android/library/imagezoom/ImageViewTouchBase$OnLayoutChangeListener;)V

    .line 166
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->editTopButton:Lcom/adobe/android/ui/view/AdobeButton;

    invoke-virtual {v0, v1}, Lcom/adobe/android/ui/view/AdobeButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 167
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->editBottomButton:Lcom/adobe/android/ui/view/AdobeButton;

    invoke-virtual {v0, v1}, Lcom/adobe/android/ui/view/AdobeButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 168
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->clearButtonTop:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 169
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->clearButtonBottom:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 171
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mInputManager:Landroid/view/inputmethod/InputMethodManager;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->editTopText:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/view/inputmethod/InputMethodManager;->isActive(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_44

    .line 172
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mInputManager:Landroid/view/inputmethod/InputMethodManager;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->editTopText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 174
    :cond_44
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mInputManager:Landroid/view/inputmethod/InputMethodManager;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->editBottomText:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/view/inputmethod/InputMethodManager;->isActive(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_59

    .line 175
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mInputManager:Landroid/view/inputmethod/InputMethodManager;

    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->editBottomText:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 178
    :cond_59
    return-void
.end method

.method public onDestroy()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 182
    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mCanvas:Landroid/graphics/Canvas;

    .line 183
    iput-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mInputManager:Landroid/view/inputmethod/InputMethodManager;

    .line 184
    iget-object v0, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v0, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->clearOverlays()V

    .line 185
    invoke-super {p0}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onDestroy()V

    .line 186
    return-void
.end method

.method public onDown(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V
    .registers 2
    .param p1, "view"    # Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .prologue
    .line 541
    return-void
.end method

.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .registers 7
    .param p1, "v"    # Landroid/widget/TextView;
    .param p2, "actionId"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 231
    if-eqz p1, :cond_20

    .line 232
    const/4 v2, 0x6

    if-eq p2, v2, :cond_7

    if-nez p2, :cond_20

    .line 233
    :cond_7
    iget-object v1, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    check-cast v1, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;

    .line 234
    .local v1, "image":Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getSelectedHighlightView()Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    move-result-object v2

    if-eqz v2, :cond_20

    .line 235
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;->getSelectedHighlightView()Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    move-result-object v0

    .line 236
    .local v0, "d":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    invoke-virtual {v0}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v2

    instance-of v2, v2, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    if-eqz v2, :cond_20

    .line 237
    invoke-direct {p0, v0}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->endEditView(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    .line 243
    .end local v0    # "d":Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    .end local v1    # "image":Lcom/adobe/creativesdk/aviary/widget/ImageViewDrawableOverlay;
    :cond_20
    const/4 v2, 0x0

    return v2
.end method

.method public onFocusChange(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V
    .registers 3
    .param p1, "newFocus"    # Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;
    .param p2, "oldFocus"    # Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .prologue
    .line 451
    if-eqz p2, :cond_7

    .line 452
    if-nez p1, :cond_7

    .line 453
    invoke-direct {p0, p2}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->endEditView(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    .line 456
    :cond_7
    return-void
.end method

.method protected onGenerateResult()V
    .registers 9

    .prologue
    .line 201
    sget-object v3, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;->MEME:Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;

    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory;->get(Lcom/adobe/creativesdk/aviary/internal/filters/ToolLoaderFactory$Tools;)Lcom/adobe/creativesdk/aviary/internal/headless/filters/IFilter;

    move-result-object v1

    check-cast v1, Lcom/adobe/creativesdk/aviary/internal/filters/MemeFilter;

    .line 202
    .local v1, "filter":Lcom/adobe/creativesdk/aviary/internal/filters/MemeFilter;
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v3}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v3

    invoke-static {v3}, Lcom/adobe/creativesdk/aviary/internal/utils/MatrixUtils;->getScale(Landroid/graphics/Matrix;)[F

    move-result-object v3

    const/4 v4, 0x0

    aget v2, v3, v4

    .line 204
    .local v2, "scale":F
    iget v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->paddingTop:I

    int-to-double v4, v3

    float-to-double v6, v2

    div-double/2addr v4, v6

    invoke-virtual {v1, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/filters/MemeFilter;->setPaddingTop(D)V

    .line 205
    iget v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->paddingBottom:I

    int-to-double v4, v3

    float-to-double v6, v2

    div-double/2addr v4, v6

    invoke-virtual {v1, v4, v5}, Lcom/adobe/creativesdk/aviary/internal/filters/MemeFilter;->setPaddingBottom(D)V

    .line 207
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mTypeface:Landroid/graphics/Typeface;

    if-eqz v3, :cond_2e

    .line 208
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->fontName:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lcom/adobe/creativesdk/aviary/internal/filters/MemeFilter;->setAssetFontName(Ljava/lang/String;)V

    .line 211
    :cond_2e
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mTypefaceSourceDir:Ljava/lang/String;

    if-eqz v3, :cond_37

    .line 212
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mTypefaceSourceDir:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lcom/adobe/creativesdk/aviary/internal/filters/MemeFilter;->setFontSourceDir(Ljava/lang/String;)V

    .line 215
    :cond_37
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->topHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    if-eqz v3, :cond_40

    .line 216
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->topHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-direct {p0, v3, v1}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->flattenText(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;Lcom/adobe/creativesdk/aviary/internal/filters/MemeFilter;)V

    .line 219
    :cond_40
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->bottomHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    if-eqz v3, :cond_49

    .line 220
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->bottomHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-direct {p0, v3, v1}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->flattenText(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;Lcom/adobe/creativesdk/aviary/internal/filters/MemeFilter;)V

    .line 223
    :cond_49
    invoke-virtual {v1}, Lcom/adobe/creativesdk/aviary/internal/filters/MemeFilter;->getActions()Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    move-result-object v3

    invoke-virtual {v3}, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;

    .line 224
    .local v0, "actionList":Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    invoke-virtual {v3, v0}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setActionList(Lcom/adobe/creativesdk/aviary/internal/headless/moa/MoaActionList;)V

    .line 225
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    iget-object v4, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mToolAction:Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;

    invoke-virtual {v3, v4}, Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;->setToolAction(Lcom/adobe/creativesdk/aviary/internal/vo/ToolActionVO;)V

    .line 226
    iget-object v3, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mEditResult:Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;

    invoke-super {p0, v3}, Lcom/adobe/creativesdk/aviary/panels/AbstractContentPanel;->onGenerateResult(Lcom/adobe/creativesdk/aviary/internal/vo/EditToolResultVO;)V

    .line 227
    return-void
.end method

.method public onLayoutChanged(ZIIII)V
    .registers 14
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .prologue
    .line 636
    if-eqz p1, :cond_43

    .line 637
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mImageView:Lit/sephiroth/android/library/imagezoom/ImageViewTouch;

    invoke-virtual {v6}, Lit/sephiroth/android/library/imagezoom/ImageViewTouch;->getImageViewMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    .line 638
    .local v1, "mImageMatrix":Landroid/graphics/Matrix;
    invoke-static {v1}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->getMatrixValues(Landroid/graphics/Matrix;)[F

    move-result-object v2

    .line 639
    .local v2, "matrixValues":[F
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    int-to-float v5, v6

    .line 640
    .local v5, "w":F
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    int-to-float v0, v6

    .line 641
    .local v0, "h":F
    const/4 v6, 0x0

    aget v3, v2, v6

    .line 643
    .local v3, "scale":F
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->topHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    if-eqz v6, :cond_30

    .line 644
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->topHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v4

    check-cast v4, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;

    .line 645
    .local v4, "text":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;
    mul-float v6, v5, v3

    mul-float v7, v0, v3

    invoke-virtual {v4, v6, v7}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->setContentSize(FF)V

    .line 648
    .end local v4    # "text":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;
    :cond_30
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->bottomHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    if-eqz v6, :cond_43

    .line 649
    iget-object v6, p0, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->bottomHv:Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    invoke-virtual {v6}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v4

    check-cast v4, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;

    .line 650
    .restart local v4    # "text":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;
    mul-float v6, v5, v3

    mul-float v7, v0, v3

    invoke-virtual {v4, v6, v7}, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;->setContentSize(FF)V

    .line 653
    .end local v0    # "h":F
    .end local v1    # "mImageMatrix":Landroid/graphics/Matrix;
    .end local v2    # "matrixValues":[F
    .end local v3    # "scale":F
    .end local v4    # "text":Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/AdobeImageMemeTextDrawable;
    .end local v5    # "w":F
    :cond_43
    return-void
.end method

.method public onMove(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V
    .registers 2
    .param p1, "view"    # Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .prologue
    .line 544
    return-void
.end method

.method public onTopClick(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V
    .registers 3
    .param p1, "view"    # Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;

    .prologue
    .line 329
    if-eqz p1, :cond_d

    .line 330
    invoke-virtual {p1}, Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;->getContent()Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/FeatherDrawable;

    move-result-object v0

    instance-of v0, v0, Lcom/adobe/creativesdk/aviary/internal/graphics/drawable/EditableDrawable;

    if-eqz v0, :cond_d

    .line 331
    invoke-direct {p0, p1}, Lcom/adobe/creativesdk/aviary/panels/MemePanel;->beginEditView(Lcom/adobe/creativesdk/aviary/widget/DrawableHighlightView;)V

    .line 334
    :cond_d
    return-void
.end method
