.class public Lcom/google/android/gms/auth/api/proxy/ProxyResponse;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/google/android/gms/auth/api/proxy/ProxyResponse;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final body:[B

.field public final googlePlayServicesStatusCode:I

.field public final recoveryAction:Landroid/app/PendingIntent;

.field public final statusCode:I

.field final versionCode:I

.field final zzRE:Landroid/os/Bundle;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/google/android/gms/auth/api/proxy/zzc;

    invoke-direct {v0}, Lcom/google/android/gms/auth/api/proxy/zzc;-><init>()V

    sput-object v0, Lcom/google/android/gms/auth/api/proxy/ProxyResponse;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(IILandroid/app/PendingIntent;ILandroid/os/Bundle;[B)V
    .registers 7
    .param p1, "version"    # I
    .param p2, "googlePlayServicesStatusCode"    # I
    .param p3, "recoveryAction"    # Landroid/app/PendingIntent;
    .param p4, "statusCode"    # I
    .param p5, "headers"    # Landroid/os/Bundle;
    .param p6, "body"    # [B

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/auth/api/proxy/ProxyResponse;->versionCode:I

    iput p2, p0, Lcom/google/android/gms/auth/api/proxy/ProxyResponse;->googlePlayServicesStatusCode:I

    iput p4, p0, Lcom/google/android/gms/auth/api/proxy/ProxyResponse;->statusCode:I

    iput-object p5, p0, Lcom/google/android/gms/auth/api/proxy/ProxyResponse;->zzRE:Landroid/os/Bundle;

    iput-object p6, p0, Lcom/google/android/gms/auth/api/proxy/ProxyResponse;->body:[B

    iput-object p3, p0, Lcom/google/android/gms/auth/api/proxy/ProxyResponse;->recoveryAction:Landroid/app/PendingIntent;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 3
    .param p1, "parcel"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/auth/api/proxy/zzc;->zza(Lcom/google/android/gms/auth/api/proxy/ProxyResponse;Landroid/os/Parcel;I)V

    return-void
.end method
