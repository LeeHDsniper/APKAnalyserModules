.class Landroid/support/v7/internal/widget/SpinnerCompat$DropdownPopup;
.super Landroid/support/v7/widget/ListPopupWindow;
.source "SpinnerCompat.java"

# interfaces
.implements Landroid/support/v7/internal/widget/SpinnerCompat$SpinnerPopup;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/internal/widget/SpinnerCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DropdownPopup"
.end annotation


# instance fields
.field private mAdapter:Landroid/widget/ListAdapter;

.field private mHintText:Ljava/lang/CharSequence;

.field final synthetic this$0:Landroid/support/v7/internal/widget/SpinnerCompat;


# direct methods
.method public constructor <init>(Landroid/support/v7/internal/widget/SpinnerCompat;Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 6
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "attrs"    # Landroid/util/AttributeSet;
    .param p4, "defStyleAttr"    # I

    .prologue
    .line 983
    iput-object p1, p0, Landroid/support/v7/internal/widget/SpinnerCompat$DropdownPopup;->this$0:Landroid/support/v7/internal/widget/SpinnerCompat;

    .line 984
    invoke-direct {p0, p2, p3, p4}, Landroid/support/v7/widget/ListPopupWindow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 986
    invoke-virtual {p0, p1}, Landroid/support/v7/internal/widget/SpinnerCompat$DropdownPopup;->setAnchorView(Landroid/view/View;)V

    .line 987
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/support/v7/internal/widget/SpinnerCompat$DropdownPopup;->setModal(Z)V

    .line 988
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/support/v7/internal/widget/SpinnerCompat$DropdownPopup;->setPromptPosition(I)V

    .line 990
    new-instance v0, Landroid/support/v7/internal/widget/SpinnerCompat$DropdownPopup$1;

    invoke-direct {v0, p0, p1}, Landroid/support/v7/internal/widget/SpinnerCompat$DropdownPopup$1;-><init>(Landroid/support/v7/internal/widget/SpinnerCompat$DropdownPopup;Landroid/support/v7/internal/widget/SpinnerCompat;)V

    invoke-virtual {p0, v0}, Landroid/support/v7/internal/widget/SpinnerCompat$DropdownPopup;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 1001
    return-void
.end method

.method static synthetic access$300(Landroid/support/v7/internal/widget/SpinnerCompat$DropdownPopup;)Landroid/widget/ListAdapter;
    .registers 2
    .param p0, "x0"    # Landroid/support/v7/internal/widget/SpinnerCompat$DropdownPopup;

    .prologue
    .line 976
    iget-object v0, p0, Landroid/support/v7/internal/widget/SpinnerCompat$DropdownPopup;->mAdapter:Landroid/widget/ListAdapter;

    return-object v0
.end method


# virtual methods
.method public setAdapter(Landroid/widget/ListAdapter;)V
    .registers 2
    .param p1, "adapter"    # Landroid/widget/ListAdapter;

    .prologue
    .line 1005
    invoke-super {p0, p1}, Landroid/support/v7/widget/ListPopupWindow;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 1006
    iput-object p1, p0, Landroid/support/v7/internal/widget/SpinnerCompat$DropdownPopup;->mAdapter:Landroid/widget/ListAdapter;

    .line 1007
    return-void
.end method

.method public setPromptText(Ljava/lang/CharSequence;)V
    .registers 2
    .param p1, "hintText"    # Ljava/lang/CharSequence;

    .prologue
    .line 1015
    iput-object p1, p0, Landroid/support/v7/internal/widget/SpinnerCompat$DropdownPopup;->mHintText:Ljava/lang/CharSequence;

    .line 1016
    return-void
.end method
