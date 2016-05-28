.class public Lcom/adobe/android/ui/view/AdobeButton;
.super Landroid/widget/Button;
.source "AdobeButton.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 18
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/adobe/android/ui/view/AdobeButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    invoke-direct {p0, p1, p2, v0}, Lcom/adobe/android/ui/view/AdobeButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 23
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 26
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 28
    invoke-virtual {p0}, Lcom/adobe/android/ui/view/AdobeButton;->isInEditMode()Z

    move-result v3

    if-eqz v3, :cond_a

    .line 37
    :goto_9
    return-void

    .line 32
    :cond_a
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    .line 33
    .local v2, "theme":Landroid/content/res/Resources$Theme;
    sget-object v3, Lcom/adobe/android/ui/R$styleable;->AdobeTextViewCustomFont:[I

    const/4 v4, 0x0

    invoke-virtual {v2, p2, v3, p3, v4}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 34
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v3, Lcom/adobe/android/ui/R$styleable;->AdobeTextViewCustomFont_fontFamily:I

    invoke-virtual {v0, v3}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 35
    .local v1, "font":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lcom/adobe/android/ui/view/AdobeButton;->setTypeface(Ljava/lang/String;)V

    .line 36
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_9
.end method


# virtual methods
.method public setTextAppearance(Landroid/content/Context;I)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "resid"    # I

    .prologue
    .line 53
    invoke-super {p0, p1, p2}, Landroid/widget/Button;->setTextAppearance(Landroid/content/Context;I)V

    .line 54
    return-void
.end method

.method public setTypeface(Ljava/lang/String;)V
    .registers 7
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 40
    if-eqz p1, :cond_11

    .line 42
    :try_start_2
    invoke-virtual {p0}, Lcom/adobe/android/ui/view/AdobeButton;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    invoke-static {v2, p1}, Lcom/adobe/android/ui/utils/TypefaceUtils;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v0

    .line 43
    .local v0, "font":Landroid/graphics/Typeface;
    invoke-virtual {p0, v0}, Lcom/adobe/android/ui/view/AdobeButton;->setTypeface(Landroid/graphics/Typeface;)V
    :try_end_11
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_11} :catch_12

    .line 49
    .end local v0    # "font":Landroid/graphics/Typeface;
    :cond_11
    :goto_11
    return-void

    .line 44
    :catch_12
    move-exception v1

    .line 45
    .local v1, "t":Ljava/lang/Throwable;
    const-string v2, "AdobeButton"

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

    .line 46
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_11
.end method
