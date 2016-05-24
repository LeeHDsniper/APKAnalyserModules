.class public Lcom/getbase/floatingactionbutton/FloatingActionsMenu$SavedState;
.super Landroid/view/View$BaseSavedState;
.source "FloatingActionsMenu.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getbase/floatingactionbutton/FloatingActionsMenu;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SavedState"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/getbase/floatingactionbutton/FloatingActionsMenu$SavedState;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public mExpanded:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 592
    new-instance v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$SavedState$1;

    invoke-direct {v0}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$SavedState$1;-><init>()V

    sput-object v0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$SavedState;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .registers 4
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v0, 0x1

    .line 582
    invoke-direct {p0, p1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcel;)V

    .line 583
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-ne v1, v0, :cond_d

    :goto_a
    iput-boolean v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$SavedState;->mExpanded:Z

    .line 584
    return-void

    .line 583
    :cond_d
    const/4 v0, 0x0

    goto :goto_a
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/getbase/floatingactionbutton/FloatingActionsMenu$1;)V
    .registers 3
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/getbase/floatingactionbutton/FloatingActionsMenu$1;

    .prologue
    .line 574
    invoke-direct {p0, p1}, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$SavedState;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcelable;)V
    .registers 2
    .param p1, "parcel"    # Landroid/os/Parcelable;

    .prologue
    .line 578
    invoke-direct {p0, p1}, Landroid/view/View$BaseSavedState;-><init>(Landroid/os/Parcelable;)V

    .line 579
    return-void
.end method


# virtual methods
.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 588
    invoke-super {p0, p1, p2}, Landroid/view/View$BaseSavedState;->writeToParcel(Landroid/os/Parcel;I)V

    .line 589
    iget-boolean v0, p0, Lcom/getbase/floatingactionbutton/FloatingActionsMenu$SavedState;->mExpanded:Z

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    :goto_8
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 590
    return-void

    .line 589
    :cond_c
    const/4 v0, 0x0

    goto :goto_8
.end method
