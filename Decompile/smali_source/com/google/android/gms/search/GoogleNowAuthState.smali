.class public Lcom/google/android/gms/search/GoogleNowAuthState;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/google/android/gms/search/GoogleNowAuthState;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final mVersionCode:I

.field zzaNM:Ljava/lang/String;

.field zzaNN:Ljava/lang/String;

.field zzaNO:J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/google/android/gms/search/zza;

    invoke-direct {v0}, Lcom/google/android/gms/search/zza;-><init>()V

    sput-object v0, Lcom/google/android/gms/search/GoogleNowAuthState;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(ILjava/lang/String;Ljava/lang/String;J)V
    .registers 6
    .param p1, "versionCode"    # I
    .param p2, "authCode"    # Ljava/lang/String;
    .param p3, "accessToken"    # Ljava/lang/String;
    .param p4, "nextAllowedTimeMillis"    # J

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/google/android/gms/search/GoogleNowAuthState;->mVersionCode:I

    iput-object p2, p0, Lcom/google/android/gms/search/GoogleNowAuthState;->zzaNM:Ljava/lang/String;

    iput-object p3, p0, Lcom/google/android/gms/search/GoogleNowAuthState;->zzaNN:Ljava/lang/String;

    iput-wide p4, p0, Lcom/google/android/gms/search/GoogleNowAuthState;->zzaNO:J

    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public getAccessToken()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/search/GoogleNowAuthState;->zzaNN:Ljava/lang/String;

    return-object v0
.end method

.method public getAuthCode()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/search/GoogleNowAuthState;->zzaNM:Ljava/lang/String;

    return-object v0
.end method

.method public getNextAllowedTimeMillis()J
    .registers 3

    iget-wide v0, p0, Lcom/google/android/gms/search/GoogleNowAuthState;->zzaNO:J

    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mAuthCode = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/search/GoogleNowAuthState;->zzaNM:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nmAccessToken = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/google/android/gms/search/GoogleNowAuthState;->zzaNN:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\nmNextAllowedTimeMillis = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v2, p0, Lcom/google/android/gms/search/GoogleNowAuthState;->zzaNO:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 3
    .param p1, "parcel"    # Landroid/os/Parcel;
    .param p2, "i"    # I

    .prologue
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/search/zza;->zza(Lcom/google/android/gms/search/GoogleNowAuthState;Landroid/os/Parcel;I)V

    return-void
.end method
