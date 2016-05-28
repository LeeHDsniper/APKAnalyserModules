.class Landroid/support/v7/app/AppCompatDelegateImplV7$PanelFeatureState$SavedState;
.super Ljava/lang/Object;
.source "AppCompatDelegateImplV7.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/app/AppCompatDelegateImplV7$PanelFeatureState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SavedState"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Landroid/support/v7/app/AppCompatDelegateImplV7$PanelFeatureState$SavedState;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field featureId:I

.field isOpen:Z

.field menuState:Landroid/os/Bundle;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 1787
    new-instance v0, Landroid/support/v7/app/AppCompatDelegateImplV7$PanelFeatureState$SavedState$1;

    invoke-direct {v0}, Landroid/support/v7/app/AppCompatDelegateImplV7$PanelFeatureState$SavedState$1;-><init>()V

    sput-object v0, Landroid/support/v7/app/AppCompatDelegateImplV7$PanelFeatureState$SavedState;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 1757
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$1100(Landroid/os/Parcel;)Landroid/support/v7/app/AppCompatDelegateImplV7$PanelFeatureState$SavedState;
    .registers 2
    .param p0, "x0"    # Landroid/os/Parcel;

    .prologue
    .line 1757
    invoke-static {p0}, Landroid/support/v7/app/AppCompatDelegateImplV7$PanelFeatureState$SavedState;->readFromParcel(Landroid/os/Parcel;)Landroid/support/v7/app/AppCompatDelegateImplV7$PanelFeatureState$SavedState;

    move-result-object v0

    return-object v0
.end method

.method private static readFromParcel(Landroid/os/Parcel;)Landroid/support/v7/app/AppCompatDelegateImplV7$PanelFeatureState$SavedState;
    .registers 4
    .param p0, "source"    # Landroid/os/Parcel;

    .prologue
    const/4 v1, 0x1

    .line 1776
    new-instance v0, Landroid/support/v7/app/AppCompatDelegateImplV7$PanelFeatureState$SavedState;

    invoke-direct {v0}, Landroid/support/v7/app/AppCompatDelegateImplV7$PanelFeatureState$SavedState;-><init>()V

    .line 1777
    .local v0, "savedState":Landroid/support/v7/app/AppCompatDelegateImplV7$PanelFeatureState$SavedState;
    invoke-virtual {p0}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, v0, Landroid/support/v7/app/AppCompatDelegateImplV7$PanelFeatureState$SavedState;->featureId:I

    .line 1778
    invoke-virtual {p0}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-ne v2, v1, :cond_1f

    :goto_12
    iput-boolean v1, v0, Landroid/support/v7/app/AppCompatDelegateImplV7$PanelFeatureState$SavedState;->isOpen:Z

    .line 1780
    iget-boolean v1, v0, Landroid/support/v7/app/AppCompatDelegateImplV7$PanelFeatureState$SavedState;->isOpen:Z

    if-eqz v1, :cond_1e

    .line 1781
    invoke-virtual {p0}, Landroid/os/Parcel;->readBundle()Landroid/os/Bundle;

    move-result-object v1

    iput-object v1, v0, Landroid/support/v7/app/AppCompatDelegateImplV7$PanelFeatureState$SavedState;->menuState:Landroid/os/Bundle;

    .line 1784
    :cond_1e
    return-object v0

    .line 1778
    :cond_1f
    const/4 v1, 0x0

    goto :goto_12
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    .prologue
    .line 1763
    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 1767
    iget v0, p0, Landroid/support/v7/app/AppCompatDelegateImplV7$PanelFeatureState$SavedState;->featureId:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 1768
    iget-boolean v0, p0, Landroid/support/v7/app/AppCompatDelegateImplV7$PanelFeatureState$SavedState;->isOpen:Z

    if-eqz v0, :cond_17

    const/4 v0, 0x1

    :goto_a
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 1770
    iget-boolean v0, p0, Landroid/support/v7/app/AppCompatDelegateImplV7$PanelFeatureState$SavedState;->isOpen:Z

    if-eqz v0, :cond_16

    .line 1771
    iget-object v0, p0, Landroid/support/v7/app/AppCompatDelegateImplV7$PanelFeatureState$SavedState;->menuState:Landroid/os/Bundle;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeBundle(Landroid/os/Bundle;)V

    .line 1773
    :cond_16
    return-void

    .line 1768
    :cond_17
    const/4 v0, 0x0

    goto :goto_a
.end method
