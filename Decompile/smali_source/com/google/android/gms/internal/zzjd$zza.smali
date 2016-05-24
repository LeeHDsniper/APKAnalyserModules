.class public abstract Lcom/google/android/gms/internal/zzjd$zza;
.super Landroid/os/Binder;

# interfaces
.implements Lcom/google/android/gms/internal/zzjd;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzjd;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "zza"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzjd$zza$zza;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Landroid/os/Binder;-><init>()V

    const-string v0, "com.google.android.gms.appdatasearch.internal.ILightweightAppDataSearchCallbacks"

    invoke-virtual {p0, p0, v0}, Lcom/google/android/gms/internal/zzjd$zza;->attachInterface(Landroid/os/IInterface;Ljava/lang/String;)V

    return-void
.end method

.method public static zzag(Landroid/os/IBinder;)Lcom/google/android/gms/internal/zzjd;
    .registers 3

    if-nez p0, :cond_4

    const/4 v0, 0x0

    :goto_3
    return-object v0

    :cond_4
    const-string v0, "com.google.android.gms.appdatasearch.internal.ILightweightAppDataSearchCallbacks"

    invoke-interface {p0, v0}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    move-result-object v0

    if-eqz v0, :cond_13

    instance-of v1, v0, Lcom/google/android/gms/internal/zzjd;

    if-eqz v1, :cond_13

    check-cast v0, Lcom/google/android/gms/internal/zzjd;

    goto :goto_3

    :cond_13
    new-instance v0, Lcom/google/android/gms/internal/zzjd$zza$zza;

    invoke-direct {v0, p0}, Lcom/google/android/gms/internal/zzjd$zza$zza;-><init>(Landroid/os/IBinder;)V

    goto :goto_3
.end method


# virtual methods
.method public asBinder()Landroid/os/IBinder;
    .registers 1

    return-object p0
.end method

.method public onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z
    .registers 9
    .param p1, "code"    # I
    .param p2, "data"    # Landroid/os/Parcel;
    .param p3, "reply"    # Landroid/os/Parcel;
    .param p4, "flags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    const/4 v3, 0x1

    sparse-switch p1, :sswitch_data_8a

    invoke-super {p0, p1, p2, p3, p4}, Landroid/os/Binder;->onTransact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    move-result v3

    :goto_9
    return v3

    :sswitch_a
    const-string v0, "com.google.android.gms.appdatasearch.internal.ILightweightAppDataSearchCallbacks"

    invoke-virtual {p3, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    goto :goto_9

    :sswitch_10
    const-string v0, "com.google.android.gms.appdatasearch.internal.ILightweightAppDataSearchCallbacks"

    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_27

    sget-object v0, Lcom/google/android/gms/common/api/Status;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/Status;

    :goto_23
    invoke-virtual {p0, v0}, Lcom/google/android/gms/internal/zzjd$zza;->zzc(Lcom/google/android/gms/common/api/Status;)V

    goto :goto_9

    :cond_27
    move-object v0, v1

    goto :goto_23

    :sswitch_29
    const-string v0, "com.google.android.gms.appdatasearch.internal.ILightweightAppDataSearchCallbacks"

    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_4f

    sget-object v0, Lcom/google/android/gms/common/api/Status;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/Status;

    move-object v2, v0

    :goto_3d
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_51

    sget-object v0, Landroid/os/ParcelFileDescriptor;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/ParcelFileDescriptor;

    :goto_4b
    invoke-virtual {p0, v2, v0}, Lcom/google/android/gms/internal/zzjd$zza;->zza(Lcom/google/android/gms/common/api/Status;Landroid/os/ParcelFileDescriptor;)V

    goto :goto_9

    :cond_4f
    move-object v2, v1

    goto :goto_3d

    :cond_51
    move-object v0, v1

    goto :goto_4b

    :sswitch_53
    const-string v0, "com.google.android.gms.appdatasearch.internal.ILightweightAppDataSearchCallbacks"

    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_71

    sget-object v0, Lcom/google/android/gms/common/api/Status;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v0, p2}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/common/api/Status;

    :goto_66
    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v1

    if-eqz v1, :cond_73

    move v1, v3

    :goto_6d
    invoke-virtual {p0, v0, v1}, Lcom/google/android/gms/internal/zzjd$zza;->zza(Lcom/google/android/gms/common/api/Status;Z)V

    goto :goto_9

    :cond_71
    move-object v0, v1

    goto :goto_66

    :cond_73
    const/4 v1, 0x0

    goto :goto_6d

    :sswitch_75
    const-string v0, "com.google.android.gms.appdatasearch.internal.ILightweightAppDataSearchCallbacks"

    invoke-virtual {p2, v0}, Landroid/os/Parcel;->enforceInterface(Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-eqz v0, :cond_86

    sget-object v0, Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;->CREATOR:Lcom/google/android/gms/appdatasearch/zzg;

    invoke-virtual {v0, p2}, Lcom/google/android/gms/appdatasearch/zzg;->zzx(Landroid/os/Parcel;)Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;

    move-result-object v1

    :cond_86
    invoke-virtual {p0, v1}, Lcom/google/android/gms/internal/zzjd$zza;->zza(Lcom/google/android/gms/appdatasearch/GetRecentContextCall$Response;)V

    goto :goto_9

    :sswitch_data_8a
    .sparse-switch
        0x1 -> :sswitch_10
        0x2 -> :sswitch_29
        0x3 -> :sswitch_53
        0x4 -> :sswitch_75
        0x5f4e5446 -> :sswitch_a
    .end sparse-switch
.end method
