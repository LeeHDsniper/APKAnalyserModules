.class Landroid/support/v7/app/AppCompatDelegateImplV11;
.super Landroid/support/v7/app/AppCompatDelegateImplV7;
.source "AppCompatDelegateImplV11.java"


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/view/Window;Landroid/support/v7/app/AppCompatCallback;)V
    .registers 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "window"    # Landroid/view/Window;
    .param p3, "callback"    # Landroid/support/v7/app/AppCompatCallback;

    .prologue
    .line 28
    invoke-direct {p0, p1, p2, p3}, Landroid/support/v7/app/AppCompatDelegateImplV7;-><init>(Landroid/content/Context;Landroid/view/Window;Landroid/support/v7/app/AppCompatCallback;)V

    .line 29
    return-void
.end method


# virtual methods
.method callActivityOnCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .registers 7
    .param p1, "parent"    # Landroid/view/View;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "context"    # Landroid/content/Context;
    .param p4, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 34
    invoke-super {p0, p1, p2, p3, p4}, Landroid/support/v7/app/AppCompatDelegateImplV7;->callActivityOnCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v0

    .line 35
    .local v0, "view":Landroid/view/View;
    if-eqz v0, :cond_7

    .line 45
    .end local v0    # "view":Landroid/view/View;
    :goto_6
    return-object v0

    .line 40
    .restart local v0    # "view":Landroid/view/View;
    :cond_7
    iget-object v1, p0, Landroid/support/v7/app/AppCompatDelegateImplV11;->mOriginalWindowCallback:Landroid/view/Window$Callback;

    instance-of v1, v1, Landroid/view/LayoutInflater$Factory2;

    if-eqz v1, :cond_16

    .line 41
    iget-object v1, p0, Landroid/support/v7/app/AppCompatDelegateImplV11;->mOriginalWindowCallback:Landroid/view/Window$Callback;

    check-cast v1, Landroid/view/LayoutInflater$Factory2;

    invoke-interface {v1, p1, p2, p3, p4}, Landroid/view/LayoutInflater$Factory2;->onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object v0

    goto :goto_6

    .line 45
    :cond_16
    const/4 v0, 0x0

    goto :goto_6
.end method
