.class public Landroid/support/v7/app/AlertDialog$Builder;
.super Ljava/lang/Object;
.source "AlertDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/app/AlertDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private final P:Landroid/support/v7/app/AlertController$AlertParams;

.field private mTheme:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 269
    const/4 v0, 0x0

    invoke-static {p1, v0}, Landroid/support/v7/app/AlertDialog;->resolveDialogTheme(Landroid/content/Context;I)I

    move-result v0

    invoke-direct {p0, p1, v0}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    .line 270
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .registers 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "theme"    # I

    .prologue
    .line 279
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 280
    new-instance v0, Landroid/support/v7/app/AlertController$AlertParams;

    new-instance v1, Landroid/view/ContextThemeWrapper;

    invoke-static {p1, p2}, Landroid/support/v7/app/AlertDialog;->resolveDialogTheme(Landroid/content/Context;I)I

    move-result v2

    invoke-direct {v1, p1, v2}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-direct {v0, v1}, Landroid/support/v7/app/AlertController$AlertParams;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroid/support/v7/app/AlertDialog$Builder;->P:Landroid/support/v7/app/AlertController$AlertParams;

    .line 282
    iput p2, p0, Landroid/support/v7/app/AlertDialog$Builder;->mTheme:I

    .line 283
    return-void
.end method


# virtual methods
.method public create()Landroid/support/v7/app/AlertDialog;
    .registers 5

    .prologue
    .line 882
    new-instance v0, Landroid/support/v7/app/AlertDialog;

    iget-object v1, p0, Landroid/support/v7/app/AlertDialog$Builder;->P:Landroid/support/v7/app/AlertController$AlertParams;

    iget-object v1, v1, Landroid/support/v7/app/AlertController$AlertParams;->mContext:Landroid/content/Context;

    iget v2, p0, Landroid/support/v7/app/AlertDialog$Builder;->mTheme:I

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Landroid/support/v7/app/AlertDialog;-><init>(Landroid/content/Context;IZ)V

    .line 883
    .local v0, "dialog":Landroid/support/v7/app/AlertDialog;
    iget-object v1, p0, Landroid/support/v7/app/AlertDialog$Builder;->P:Landroid/support/v7/app/AlertController$AlertParams;

    # getter for: Landroid/support/v7/app/AlertDialog;->mAlert:Landroid/support/v7/app/AlertController;
    invoke-static {v0}, Landroid/support/v7/app/AlertDialog;->access$000(Landroid/support/v7/app/AlertDialog;)Landroid/support/v7/app/AlertController;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v7/app/AlertController$AlertParams;->apply(Landroid/support/v7/app/AlertController;)V

    .line 884
    iget-object v1, p0, Landroid/support/v7/app/AlertDialog$Builder;->P:Landroid/support/v7/app/AlertController$AlertParams;

    iget-boolean v1, v1, Landroid/support/v7/app/AlertController$AlertParams;->mCancelable:Z

    invoke-virtual {v0, v1}, Landroid/support/v7/app/AlertDialog;->setCancelable(Z)V

    .line 885
    iget-object v1, p0, Landroid/support/v7/app/AlertDialog$Builder;->P:Landroid/support/v7/app/AlertController$AlertParams;

    iget-boolean v1, v1, Landroid/support/v7/app/AlertController$AlertParams;->mCancelable:Z

    if-eqz v1, :cond_26

    .line 886
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v7/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    .line 888
    :cond_26
    iget-object v1, p0, Landroid/support/v7/app/AlertDialog$Builder;->P:Landroid/support/v7/app/AlertController$AlertParams;

    iget-object v1, v1, Landroid/support/v7/app/AlertController$AlertParams;->mOnCancelListener:Landroid/content/DialogInterface$OnCancelListener;

    invoke-virtual {v0, v1}, Landroid/support/v7/app/AlertDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    .line 889
    iget-object v1, p0, Landroid/support/v7/app/AlertDialog$Builder;->P:Landroid/support/v7/app/AlertController$AlertParams;

    iget-object v1, v1, Landroid/support/v7/app/AlertController$AlertParams;->mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    invoke-virtual {v0, v1}, Landroid/support/v7/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 890
    iget-object v1, p0, Landroid/support/v7/app/AlertDialog$Builder;->P:Landroid/support/v7/app/AlertController$AlertParams;

    iget-object v1, v1, Landroid/support/v7/app/AlertController$AlertParams;->mOnKeyListener:Landroid/content/DialogInterface$OnKeyListener;

    if-eqz v1, :cond_41

    .line 891
    iget-object v1, p0, Landroid/support/v7/app/AlertDialog$Builder;->P:Landroid/support/v7/app/AlertController$AlertParams;

    iget-object v1, v1, Landroid/support/v7/app/AlertController$AlertParams;->mOnKeyListener:Landroid/content/DialogInterface$OnKeyListener;

    invoke-virtual {v0, v1}, Landroid/support/v7/app/AlertDialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    .line 893
    :cond_41
    return-object v0
.end method

.method public getContext()Landroid/content/Context;
    .registers 2

    .prologue
    .line 295
    iget-object v0, p0, Landroid/support/v7/app/AlertDialog$Builder;->P:Landroid/support/v7/app/AlertController$AlertParams;

    iget-object v0, v0, Landroid/support/v7/app/AlertController$AlertParams;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public setAdapter(Landroid/widget/ListAdapter;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;
    .registers 4
    .param p1, "adapter"    # Landroid/widget/ListAdapter;
    .param p2, "listener"    # Landroid/content/DialogInterface$OnClickListener;

    .prologue
    .line 554
    iget-object v0, p0, Landroid/support/v7/app/AlertDialog$Builder;->P:Landroid/support/v7/app/AlertController$AlertParams;

    iput-object p1, v0, Landroid/support/v7/app/AlertController$AlertParams;->mAdapter:Landroid/widget/ListAdapter;

    .line 555
    iget-object v0, p0, Landroid/support/v7/app/AlertDialog$Builder;->P:Landroid/support/v7/app/AlertController$AlertParams;

    iput-object p2, v0, Landroid/support/v7/app/AlertController$AlertParams;->mOnClickListener:Landroid/content/DialogInterface$OnClickListener;

    .line 556
    return-object p0
.end method

.method public setCustomTitle(Landroid/view/View;)Landroid/support/v7/app/AlertDialog$Builder;
    .registers 3
    .param p1, "customTitleView"    # Landroid/view/View;

    .prologue
    .line 329
    iget-object v0, p0, Landroid/support/v7/app/AlertDialog$Builder;->P:Landroid/support/v7/app/AlertController$AlertParams;

    iput-object p1, v0, Landroid/support/v7/app/AlertController$AlertParams;->mCustomTitleView:Landroid/view/View;

    .line 330
    return-object p0
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)Landroid/support/v7/app/AlertDialog$Builder;
    .registers 3
    .param p1, "icon"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 371
    iget-object v0, p0, Landroid/support/v7/app/AlertDialog$Builder;->P:Landroid/support/v7/app/AlertController$AlertParams;

    iput-object p1, v0, Landroid/support/v7/app/AlertController$AlertParams;->mIcon:Landroid/graphics/drawable/Drawable;

    .line 372
    return-object p0
.end method

.method public setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)Landroid/support/v7/app/AlertDialog$Builder;
    .registers 3
    .param p1, "onKeyListener"    # Landroid/content/DialogInterface$OnKeyListener;

    .prologue
    .line 514
    iget-object v0, p0, Landroid/support/v7/app/AlertDialog$Builder;->P:Landroid/support/v7/app/AlertController$AlertParams;

    iput-object p1, v0, Landroid/support/v7/app/AlertController$AlertParams;->mOnKeyListener:Landroid/content/DialogInterface$OnKeyListener;

    .line 515
    return-object p0
.end method

.method public setTitle(Ljava/lang/CharSequence;)Landroid/support/v7/app/AlertDialog$Builder;
    .registers 3
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 314
    iget-object v0, p0, Landroid/support/v7/app/AlertDialog$Builder;->P:Landroid/support/v7/app/AlertController$AlertParams;

    iput-object p1, v0, Landroid/support/v7/app/AlertController$AlertParams;->mTitle:Ljava/lang/CharSequence;

    .line 315
    return-object p0
.end method
