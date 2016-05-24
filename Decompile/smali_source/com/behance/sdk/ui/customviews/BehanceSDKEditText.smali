.class public Lcom/behance/sdk/ui/customviews/BehanceSDKEditText;
.super Landroid/widget/EditText;
.source "BehanceSDKEditText.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 16
    invoke-direct {p0, p1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 17
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/behance/sdk/ui/customviews/BehanceSDKEditText;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 18
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 21
    invoke-direct {p0, p1, p2}, Landroid/widget/EditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 22
    invoke-direct {p0, p1, p2}, Lcom/behance/sdk/ui/customviews/BehanceSDKEditText;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 23
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    .line 26
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/EditText;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 27
    invoke-direct {p0, p1, p2}, Lcom/behance/sdk/ui/customviews/BehanceSDKEditText;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 28
    return-void
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 41
    const/4 v0, 0x0

    .line 42
    .local v0, "fontName":Ljava/lang/String;
    if-eqz p2, :cond_b

    .line 43
    const-string v1, "http://schemas.android.com/apk/com.behance.sdk"

    const-string v2, "fontStyle"

    invoke-interface {p2, v1, v2}, Landroid/util/AttributeSet;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 45
    :cond_b
    invoke-static {p1, p0, v0}, Lcom/behance/sdk/util/BehanceSDKFontUtils;->setAdobeCleanFont(Landroid/content/Context;Landroid/view/View;Ljava/lang/String;)V

    .line 46
    return-void
.end method


# virtual methods
.method public setTypeface(Landroid/graphics/Typeface;)V
    .registers 2
    .param p1, "tf"    # Landroid/graphics/Typeface;

    .prologue
    .line 32
    invoke-super {p0, p1}, Landroid/widget/EditText;->setTypeface(Landroid/graphics/Typeface;)V

    .line 33
    return-void
.end method

.method public setTypeface(Landroid/graphics/Typeface;I)V
    .registers 3
    .param p1, "tf"    # Landroid/graphics/Typeface;
    .param p2, "style"    # I

    .prologue
    .line 37
    invoke-super {p0, p1, p2}, Landroid/widget/EditText;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 38
    return-void
.end method
