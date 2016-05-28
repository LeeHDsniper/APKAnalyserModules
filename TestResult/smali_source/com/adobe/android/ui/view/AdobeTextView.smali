.class public Lcom/adobe/android/ui/view/AdobeTextView;
.super Landroid/widget/TextView;
.source "AdobeTextView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 18
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/adobe/android/ui/view/AdobeTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 19
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 22
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/adobe/android/ui/view/AdobeTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 23
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 26
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/adobe/android/ui/view/AdobeTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 27
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .prologue
    .line 30
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 32
    invoke-virtual {p0}, Lcom/adobe/android/ui/view/AdobeTextView;->isInEditMode()Z

    move-result v2

    if-eqz v2, :cond_a

    .line 40
    :goto_9
    return-void

    .line 36
    :cond_a
    sget-object v2, Lcom/adobe/android/ui/R$styleable;->AdobeTextViewCustomFont:[I

    const/4 v3, 0x0

    invoke-virtual {p1, p2, v2, v3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 37
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v2, Lcom/adobe/android/ui/R$styleable;->AdobeTextViewCustomFont_fontFamily:I

    invoke-virtual {v0, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 38
    .local v1, "font":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lcom/adobe/android/ui/view/AdobeTextView;->setTypeface(Ljava/lang/String;)V

    .line 39
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_9
.end method


# virtual methods
.method public setTextAppearance(Landroid/content/Context;I)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "resid"    # I

    .prologue
    .line 56
    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->setTextAppearance(Landroid/content/Context;I)V

    .line 57
    return-void
.end method

.method public setTypeface(Ljava/lang/String;)V
    .registers 7
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 43
    if-eqz p1, :cond_11

    .line 45
    :try_start_2
    invoke-virtual {p0}, Lcom/adobe/android/ui/view/AdobeTextView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    invoke-static {v2, p1}, Lcom/adobe/android/ui/utils/TypefaceUtils;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v0

    .line 46
    .local v0, "font":Landroid/graphics/Typeface;
    invoke-virtual {p0, v0}, Lcom/adobe/android/ui/view/AdobeTextView;->setTypeface(Landroid/graphics/Typeface;)V
    :try_end_11
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_11} :catch_12

    .line 52
    .end local v0    # "font":Landroid/graphics/Typeface;
    :cond_11
    :goto_11
    return-void

    .line 47
    :catch_12
    move-exception v1

    .line 48
    .local v1, "t":Ljava/lang/Throwable;
    const-string v2, "AdobeImageTextView"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "unable to create font "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_11
.end method
