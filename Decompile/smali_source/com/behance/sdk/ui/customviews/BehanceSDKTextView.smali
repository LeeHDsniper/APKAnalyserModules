.class public Lcom/behance/sdk/ui/customviews/BehanceSDKTextView;
.super Landroid/widget/TextView;
.source "BehanceSDKTextView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 17
    invoke-direct {p0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 18
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/behance/sdk/ui/customviews/BehanceSDKTextView;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 20
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 23
    invoke-direct {p0, p1, p2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 24
    invoke-direct {p0, p1, p2}, Lcom/behance/sdk/ui/customviews/BehanceSDKTextView;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 25
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 28
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 29
    invoke-direct {p0, p1, p2}, Lcom/behance/sdk/ui/customviews/BehanceSDKTextView;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 30
    return-void
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 43
    const/4 v0, 0x0

    .line 44
    .local v0, "fontName":Ljava/lang/String;
    if-eqz p2, :cond_b

    .line 45
    const-string v1, "http://schemas.android.com/apk/com.behance.sdk"

    const-string v2, "fontStyle"

    invoke-interface {p2, v1, v2}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 47
    :cond_b
    invoke-static {p1, p0, v0}, Lcom/behance/sdk/util/BehanceSDKFontUtils;->setAdobeCleanFont(Landroid/content/Context;Landroid/view/View;Ljava/lang/String;)V

    .line 48
    return-void
.end method


# virtual methods
.method public setTypeface(Landroid/graphics/Typeface;)V
    .registers 2
    .param p1, "tf"    # Landroid/graphics/Typeface;

    .prologue
    .line 34
    invoke-super {p0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 35
    return-void
.end method

.method public setTypeface(Landroid/graphics/Typeface;I)V
    .registers 3
    .param p1, "tf"    # Landroid/graphics/Typeface;
    .param p2, "style"    # I

    .prologue
    .line 39
    invoke-super {p0, p1, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 40
    return-void
.end method
