.class public Lcom/google/android/gms/common/api/zzq;
.super Landroid/support/v4/app/Fragment;

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;
.implements Landroid/support/v4/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/common/api/zzq$1;,
        Lcom/google/android/gms/common/api/zzq$zza;,
        Lcom/google/android/gms/common/api/zzq$zzb;,
        Lcom/google/android/gms/common/api/zzq$zzc;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v4/app/Fragment;",
        "Landroid/content/DialogInterface$OnCancelListener;",
        "Landroid/support/v4/app/LoaderManager$LoaderCallbacks",
        "<",
        "Lcom/google/android/gms/common/ConnectionResult;",
        ">;"
    }
.end annotation


# instance fields
.field private zzaaJ:Z

.field private zzaaK:I

.field private zzaaL:Lcom/google/android/gms/common/ConnectionResult;

.field private final zzaaM:Landroid/os/Handler;

.field private final zzaaN:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/google/android/gms/common/api/zzq$zzb;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/common/api/zzq;->zzaaK:I

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/google/android/gms/common/api/zzq;->zzaaM:Landroid/os/Handler;

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/google/android/gms/common/api/zzq;->zzaaN:Landroid/util/SparseArray;

    return-void
.end method

.method private zza(ILcom/google/android/gms/common/ConnectionResult;)V
    .registers 5

    const-string v0, "GmsSupportLoaderLifecycleFragment"

    const-string v1, "Unresolved error while connecting client. Stopping auto-manage."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzq;->zzaaN:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/zzq$zzb;

    if-eqz v0, :cond_1b

    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/api/zzq;->zzbi(I)V

    iget-object v0, v0, Lcom/google/android/gms/common/api/zzq$zzb;->zzaaQ:Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;

    if-eqz v0, :cond_1b

    invoke-interface {v0, p2}, Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;->onConnectionFailed(Lcom/google/android/gms/common/ConnectionResult;)V

    :cond_1b
    invoke-direct {p0}, Lcom/google/android/gms/common/api/zzq;->zznJ()V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/common/api/zzq;)V
    .registers 1

    invoke-direct {p0}, Lcom/google/android/gms/common/api/zzq;->zznJ()V

    return-void
.end method

.method static synthetic zza(Lcom/google/android/gms/common/api/zzq;ILcom/google/android/gms/common/ConnectionResult;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/common/api/zzq;->zza(ILcom/google/android/gms/common/ConnectionResult;)V

    return-void
.end method

.method private zzb(ILcom/google/android/gms/common/ConnectionResult;)V
    .registers 5

    iget-boolean v0, p0, Lcom/google/android/gms/common/api/zzq;->zzaaJ:Z

    if-nez v0, :cond_15

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/android/gms/common/api/zzq;->zzaaJ:Z

    iput p1, p0, Lcom/google/android/gms/common/api/zzq;->zzaaK:I

    iput-object p2, p0, Lcom/google/android/gms/common/api/zzq;->zzaaL:Lcom/google/android/gms/common/ConnectionResult;

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzq;->zzaaM:Landroid/os/Handler;

    new-instance v1, Lcom/google/android/gms/common/api/zzq$zzc;

    invoke-direct {v1, p0, p1, p2}, Lcom/google/android/gms/common/api/zzq$zzc;-><init>(Lcom/google/android/gms/common/api/zzq;ILcom/google/android/gms/common/ConnectionResult;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_15
    return-void
.end method

.method public static zzc(Landroid/support/v4/app/FragmentActivity;)Lcom/google/android/gms/common/api/zzq;
    .registers 5

    const-string v0, "Must be called from main thread of process"

    invoke-static {v0}, Lcom/google/android/gms/common/internal/zzx;->zzch(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/support/v4/app/FragmentActivity;->getSupportFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    :try_start_9
    const-string v0, "GmsSupportLoaderLifecycleFragment"

    invoke-virtual {v1, v0}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/zzq;
    :try_end_11
    .catch Ljava/lang/ClassCastException; {:try_start_9 .. :try_end_11} :catch_2f

    if-eqz v0, :cond_19

    invoke-virtual {v0}, Lcom/google/android/gms/common/api/zzq;->isRemoving()Z

    move-result v2

    if-eqz v2, :cond_2e

    :cond_19
    new-instance v0, Lcom/google/android/gms/common/api/zzq;

    invoke-direct {v0}, Lcom/google/android/gms/common/api/zzq;-><init>()V

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->beginTransaction()Landroid/support/v4/app/FragmentTransaction;

    move-result-object v2

    const-string v3, "GmsSupportLoaderLifecycleFragment"

    invoke-virtual {v2, v0, v3}, Landroid/support/v4/app/FragmentTransaction;->add(Landroid/support/v4/app/Fragment;Ljava/lang/String;)Landroid/support/v4/app/FragmentTransaction;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentTransaction;->commit()I

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentManager;->executePendingTransactions()Z

    :cond_2e
    return-object v0

    :catch_2f
    move-exception v0

    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Fragment with tag GmsSupportLoaderLifecycleFragment is not a SupportLoaderLifecycleFragment"

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private zznJ()V
    .registers 6

    const/4 v4, 0x0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/android/gms/common/api/zzq;->zzaaJ:Z

    const/4 v1, -0x1

    iput v1, p0, Lcom/google/android/gms/common/api/zzq;->zzaaK:I

    iput-object v4, p0, Lcom/google/android/gms/common/api/zzq;->zzaaL:Lcom/google/android/gms/common/ConnectionResult;

    invoke-virtual {p0}, Lcom/google/android/gms/common/api/zzq;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v1

    :goto_d
    iget-object v2, p0, Lcom/google/android/gms/common/api/zzq;->zzaaN:Landroid/util/SparseArray;

    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    move-result v2

    if-ge v0, v2, :cond_30

    iget-object v2, p0, Lcom/google/android/gms/common/api/zzq;->zzaaN:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/google/android/gms/common/api/zzq;->zzbk(I)Lcom/google/android/gms/common/api/zzq$zza;

    move-result-object v3

    if-eqz v3, :cond_2d

    invoke-virtual {v3}, Lcom/google/android/gms/common/api/zzq$zza;->zznL()Z

    move-result v3

    if-eqz v3, :cond_2d

    invoke-virtual {v1, v2}, Landroid/support/v4/app/LoaderManager;->destroyLoader(I)V

    invoke-virtual {v1, v2, v4, p0}, Landroid/support/v4/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    :cond_2d
    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    :cond_30
    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .registers 7
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    packed-switch p1, :pswitch_data_24

    :cond_5
    move v0, v1

    :goto_6
    if-eqz v0, :cond_1b

    invoke-direct {p0}, Lcom/google/android/gms/common/api/zzq;->zznJ()V

    :goto_b
    return-void

    :pswitch_c
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/zzq;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    invoke-static {v2}, Lcom/google/android/gms/common/GooglePlayServicesUtil;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v2

    if-nez v2, :cond_5

    goto :goto_6

    :pswitch_17
    const/4 v2, -0x1

    if-ne p2, v2, :cond_5

    goto :goto_6

    :cond_1b
    iget v0, p0, Lcom/google/android/gms/common/api/zzq;->zzaaK:I

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzq;->zzaaL:Lcom/google/android/gms/common/ConnectionResult;

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/common/api/zzq;->zza(ILcom/google/android/gms/common/ConnectionResult;)V

    goto :goto_b

    nop

    :pswitch_data_24
    .packed-switch 0x1
        :pswitch_17
        :pswitch_c
    .end packed-switch
.end method

.method public onAttach(Landroid/app/Activity;)V
    .registers 7
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    const/4 v4, 0x0

    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onAttach(Landroid/app/Activity;)V

    const/4 v0, 0x0

    move v1, v0

    :goto_6
    iget-object v0, p0, Lcom/google/android/gms/common/api/zzq;->zzaaN:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    if-ge v1, v0, :cond_3b

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzq;->zzaaN:Landroid/util/SparseArray;

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v2

    invoke-virtual {p0, v2}, Lcom/google/android/gms/common/api/zzq;->zzbk(I)Lcom/google/android/gms/common/api/zzq$zza;

    move-result-object v3

    if-eqz v3, :cond_33

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzq;->zzaaN:Landroid/util/SparseArray;

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/zzq$zzb;

    iget-object v0, v0, Lcom/google/android/gms/common/api/zzq$zzb;->zzaaP:Lcom/google/android/gms/common/api/GoogleApiClient;

    iget-object v3, v3, Lcom/google/android/gms/common/api/zzq$zza;->zzaaP:Lcom/google/android/gms/common/api/GoogleApiClient;

    if-eq v0, v3, :cond_33

    invoke-virtual {p0}, Lcom/google/android/gms/common/api/zzq;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v0

    invoke-virtual {v0, v2, v4, p0}, Landroid/support/v4/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    :goto_2f
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_6

    :cond_33
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/zzq;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v0

    invoke-virtual {v0, v2, v4, p0}, Landroid/support/v4/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    goto :goto_2f

    :cond_3b
    return-void
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .registers 6
    .param p1, "dialogInterface"    # Landroid/content/DialogInterface;

    .prologue
    iget v0, p0, Lcom/google/android/gms/common/api/zzq;->zzaaK:I

    new-instance v1, Lcom/google/android/gms/common/ConnectionResult;

    const/16 v2, 0xd

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Lcom/google/android/gms/common/ConnectionResult;-><init>(ILandroid/app/PendingIntent;)V

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/common/api/zzq;->zza(ILcom/google/android/gms/common/ConnectionResult;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    if-eqz p1, :cond_30

    const-string v0, "resolving_error"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/google/android/gms/common/api/zzq;->zzaaJ:Z

    const-string v0, "failed_client_id"

    const/4 v1, -0x1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/common/api/zzq;->zzaaK:I

    iget v0, p0, Lcom/google/android/gms/common/api/zzq;->zzaaK:I

    if-ltz v0, :cond_30

    new-instance v1, Lcom/google/android/gms/common/ConnectionResult;

    const-string v0, "failed_status"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v2

    const-string v0, "failed_resolution"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/app/PendingIntent;

    invoke-direct {v1, v2, v0}, Lcom/google/android/gms/common/ConnectionResult;-><init>(ILandroid/app/PendingIntent;)V

    iput-object v1, p0, Lcom/google/android/gms/common/api/zzq;->zzaaL:Lcom/google/android/gms/common/ConnectionResult;

    :cond_30
    return-void
.end method

.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/support/v4/content/Loader;
    .registers 6
    .param p1, "id"    # I
    .param p2, "args"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/os/Bundle;",
            ")",
            "Landroid/support/v4/content/Loader",
            "<",
            "Lcom/google/android/gms/common/ConnectionResult;",
            ">;"
        }
    .end annotation

    .prologue
    new-instance v1, Lcom/google/android/gms/common/api/zzq$zza;

    invoke-virtual {p0}, Lcom/google/android/gms/common/api/zzq;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzq;->zzaaN:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/zzq$zzb;

    iget-object v0, v0, Lcom/google/android/gms/common/api/zzq$zzb;->zzaaP:Lcom/google/android/gms/common/api/GoogleApiClient;

    invoke-direct {v1, v2, v0}, Lcom/google/android/gms/common/api/zzq$zza;-><init>(Landroid/content/Context;Lcom/google/android/gms/common/api/GoogleApiClient;)V

    return-object v1
.end method

.method public synthetic onLoadFinished(Landroid/support/v4/content/Loader;Ljava/lang/Object;)V
    .registers 3
    .param p1, "x0"    # Landroid/support/v4/content/Loader;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    check-cast p2, Lcom/google/android/gms/common/ConnectionResult;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/google/android/gms/common/api/zzq;->zza(Landroid/support/v4/content/Loader;Lcom/google/android/gms/common/ConnectionResult;)V

    return-void
.end method

.method public onLoaderReset(Landroid/support/v4/content/Loader;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/content/Loader",
            "<",
            "Lcom/google/android/gms/common/ConnectionResult;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "loader":Landroid/support/v4/content/Loader;, "Landroid/support/v4/content/Loader<Lcom/google/android/gms/common/ConnectionResult;>;"
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 4
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    const-string v0, "resolving_error"

    iget-boolean v1, p0, Lcom/google/android/gms/common/api/zzq;->zzaaJ:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    iget v0, p0, Lcom/google/android/gms/common/api/zzq;->zzaaK:I

    if-ltz v0, :cond_2b

    const-string v0, "failed_client_id"

    iget v1, p0, Lcom/google/android/gms/common/api/zzq;->zzaaK:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "failed_status"

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzq;->zzaaL:Lcom/google/android/gms/common/ConnectionResult;

    invoke-virtual {v1}, Lcom/google/android/gms/common/ConnectionResult;->getErrorCode()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "failed_resolution"

    iget-object v1, p0, Lcom/google/android/gms/common/api/zzq;->zzaaL:Lcom/google/android/gms/common/ConnectionResult;

    invoke-virtual {v1}, Lcom/google/android/gms/common/ConnectionResult;->getResolution()Landroid/app/PendingIntent;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    :cond_2b
    return-void
.end method

.method public onStart()V
    .registers 5

    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStart()V

    iget-boolean v0, p0, Lcom/google/android/gms/common/api/zzq;->zzaaJ:Z

    if-nez v0, :cond_21

    const/4 v0, 0x0

    :goto_8
    iget-object v1, p0, Lcom/google/android/gms/common/api/zzq;->zzaaN:Landroid/util/SparseArray;

    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_21

    invoke-virtual {p0}, Lcom/google/android/gms/common/api/zzq;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/gms/common/api/zzq;->zzaaN:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3, p0}, Landroid/support/v4/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    :cond_21
    return-void
.end method

.method public zza(ILcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;)V
    .registers 9

    const/4 v4, 0x0

    const/4 v1, 0x0

    const-string v0, "GoogleApiClient instance cannot be null"

    invoke-static {p2, v0}, Lcom/google/android/gms/common/internal/zzx;->zzb(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzq;->zzaaN:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->indexOfKey(I)I

    move-result v0

    if-gez v0, :cond_41

    const/4 v0, 0x1

    :goto_10
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Already managing a GoogleApiClient with id "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/google/android/gms/common/internal/zzx;->zza(ZLjava/lang/Object;)V

    new-instance v0, Lcom/google/android/gms/common/api/zzq$zzb;

    invoke-direct {v0, p2, p3, v4}, Lcom/google/android/gms/common/api/zzq$zzb;-><init>(Lcom/google/android/gms/common/api/GoogleApiClient;Lcom/google/android/gms/common/api/GoogleApiClient$OnConnectionFailedListener;Lcom/google/android/gms/common/api/zzq$1;)V

    iget-object v2, p0, Lcom/google/android/gms/common/api/zzq;->zzaaN:Landroid/util/SparseArray;

    invoke-virtual {v2, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    invoke-virtual {p0}, Lcom/google/android/gms/common/api/zzq;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_40

    invoke-static {v1}, Landroid/support/v4/app/LoaderManager;->enableDebugLogging(Z)V

    invoke-virtual {p0}, Lcom/google/android/gms/common/api/zzq;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v0

    invoke-virtual {v0, p1, v4, p0}, Landroid/support/v4/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/support/v4/app/LoaderManager$LoaderCallbacks;)Landroid/support/v4/content/Loader;

    :cond_40
    return-void

    :cond_41
    move v0, v1

    goto :goto_10
.end method

.method public zza(Landroid/support/v4/content/Loader;Lcom/google/android/gms/common/ConnectionResult;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/content/Loader",
            "<",
            "Lcom/google/android/gms/common/ConnectionResult;",
            ">;",
            "Lcom/google/android/gms/common/ConnectionResult;",
            ")V"
        }
    .end annotation

    invoke-virtual {p2}, Lcom/google/android/gms/common/ConnectionResult;->isSuccess()Z

    move-result v0

    if-nez v0, :cond_d

    invoke-virtual {p1}, Landroid/support/v4/content/Loader;->getId()I

    move-result v0

    invoke-direct {p0, v0, p2}, Lcom/google/android/gms/common/api/zzq;->zzb(ILcom/google/android/gms/common/ConnectionResult;)V

    :cond_d
    return-void
.end method

.method public zzbi(I)V
    .registers 3

    iget-object v0, p0, Lcom/google/android/gms/common/api/zzq;->zzaaN:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->remove(I)V

    invoke-virtual {p0}, Lcom/google/android/gms/common/api/zzq;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/v4/app/LoaderManager;->destroyLoader(I)V

    return-void
.end method

.method public zzbj(I)Lcom/google/android/gms/common/api/GoogleApiClient;
    .registers 3

    invoke-virtual {p0}, Lcom/google/android/gms/common/api/zzq;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    if-eqz v0, :cond_f

    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/api/zzq;->zzbk(I)Lcom/google/android/gms/common/api/zzq$zza;

    move-result-object v0

    if-eqz v0, :cond_f

    iget-object v0, v0, Lcom/google/android/gms/common/api/zzq$zza;->zzaaP:Lcom/google/android/gms/common/api/GoogleApiClient;

    :goto_e
    return-object v0

    :cond_f
    const/4 v0, 0x0

    goto :goto_e
.end method

.method zzbk(I)Lcom/google/android/gms/common/api/zzq$zza;
    .registers 5

    :try_start_0
    invoke-virtual {p0}, Lcom/google/android/gms/common/api/zzq;->getLoaderManager()Landroid/support/v4/app/LoaderManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/v4/app/LoaderManager;->getLoader(I)Landroid/support/v4/content/Loader;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/zzq$zza;
    :try_end_a
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_a} :catch_b

    return-object v0

    :catch_b
    move-exception v0

    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Unknown loader in SupportLoaderLifecycleFragment"

    invoke-direct {v1, v2, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method
