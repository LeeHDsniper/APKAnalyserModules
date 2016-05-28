.class public abstract Landroid/support/v4/app/FragmentTransaction;
.super Ljava/lang/Object;
.source "FragmentTransaction.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 165
    return-void
.end method


# virtual methods
.method public abstract add(ILandroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;
.end method

.method public abstract add(ILandroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;
.end method

.method public abstract add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;
.end method

.method public abstract addToBackStack(Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;
.end method

.method public abstract attach(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;
.end method

.method public abstract commit()I
.end method

.method public abstract commitAllowingStateLoss()I
.end method

.method public abstract detach(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;
.end method

.method public abstract remove(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;
.end method

.method public abstract replace(ILandroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransaction;
.end method

.method public abstract replace(ILandroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;
.end method

.method public abstract setCustomAnimations(II)Landroid/support/v4/app/FragmentTransaction;
.end method
