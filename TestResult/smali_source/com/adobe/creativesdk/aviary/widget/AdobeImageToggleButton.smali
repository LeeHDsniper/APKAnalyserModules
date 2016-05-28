.class public Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;
.super Landroid/widget/ToggleButton;
.source "AdobeImageToggleButton.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 15
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 16
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 19
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 20
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 23
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ToggleButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 25
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    .line 26
    .local v2, "theme":Landroid/content/res/Resources$Theme;
    sget-object v3, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeTextViewCustomFont:[I

    const/4 v4, 0x0

    invoke-virtual {v2, p2, v3, p3, v4}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 28
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v3, Lcom/aviary/android/feather/sdk/R$styleable;->AdobeTextViewCustomFont_fontFamily:I

    invoke-virtual {v0, v3}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 29
    .local v1, "font":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;->setTypeface(Ljava/lang/String;)V

    .line 31
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 32
    return-void
.end method


# virtual methods
.method public setTextAppearance(Landroid/content/Context;I)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "resid"    # I

    .prologue
    .line 46
    invoke-super {p0, p1, p2}, Landroid/widget/ToggleButton;->setTextAppearance(Landroid/content/Context;I)V

    .line 47
    return-void
.end method

.method public setTypeface(Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 35
    if-eqz p1, :cond_11

    .line 37
    :try_start_2
    invoke-virtual {p0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    invoke-static {v1, p1}, Lcom/adobe/android/ui/utils/TypefaceUtils;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v0

    .line 38
    .local v0, "font":Landroid/graphics/Typeface;
    invoke-virtual {p0, v0}, Lcom/adobe/creativesdk/aviary/widget/AdobeImageToggleButton;->setTypeface(Landroid/graphics/Typeface;)V
    :try_end_11
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_11} :catch_12

    .line 42
    .end local v0    # "font":Landroid/graphics/Typeface;
    :cond_11
    :goto_11
    return-void

    .line 39
    :catch_12
    move-exception v1

    goto :goto_11
.end method
