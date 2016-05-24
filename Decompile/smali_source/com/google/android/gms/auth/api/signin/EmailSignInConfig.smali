.class public Lcom/google/android/gms/auth/api/signin/EmailSignInConfig;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/internal/safeparcel/SafeParcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/google/android/gms/auth/api/signin/EmailSignInConfig;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final versionCode:I

.field private final zzRO:Landroid/net/Uri;

.field private zzRP:Ljava/lang/String;

.field private zzRQ:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/google/android/gms/auth/api/signin/zza;

    invoke-direct {v0}, Lcom/google/android/gms/auth/api/signin/zza;-><init>()V

    sput-object v0, Lcom/google/android/gms/auth/api/signin/EmailSignInConfig;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(ILandroid/net/Uri;Ljava/lang/String;Landroid/net/Uri;)V
    .registers 7
    .param p1, "versionCode"    # I
    .param p2, "serverWidgetUrl"    # Landroid/net/Uri;
    .param p3, "modeQueryName"    # Ljava/lang/String;
    .param p4, "tosUrl"    # Landroid/net/Uri;

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "Server widget url cannot be null in order to use email/password sign in."

    invoke-static {p2, v0}, Lcom/google/android/gms/common/internal/zzx;->zzb(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Server widget url cannot be null in order to use email/password sign in."

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/zzx;->zzh(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;

    sget-object v0, Landroid/util/Patterns;->WEB_URL:Ljava/util/regex/Pattern;

    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v0

    const-string v1, "Invalid server widget url"

    invoke-static {v0, v1}, Lcom/google/android/gms/common/internal/zzx;->zzb(ZLjava/lang/Object;)V

    iput p1, p0, Lcom/google/android/gms/auth/api/signin/EmailSignInConfig;->versionCode:I

    iput-object p2, p0, Lcom/google/android/gms/auth/api/signin/EmailSignInConfig;->zzRO:Landroid/net/Uri;

    iput-object p3, p0, Lcom/google/android/gms/auth/api/signin/EmailSignInConfig;->zzRP:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/gms/auth/api/signin/EmailSignInConfig;->zzRQ:Landroid/net/Uri;

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
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/auth/api/signin/zza;->zza(Lcom/google/android/gms/auth/api/signin/EmailSignInConfig;Landroid/os/Parcel;I)V

    return-void
.end method

.method public zzlA()Landroid/net/Uri;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/auth/api/signin/EmailSignInConfig;->zzRO:Landroid/net/Uri;

    return-object v0
.end method

.method public zzlB()Landroid/net/Uri;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/auth/api/signin/EmailSignInConfig;->zzRQ:Landroid/net/Uri;

    return-object v0
.end method

.method public zzlC()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/auth/api/signin/EmailSignInConfig;->zzRP:Ljava/lang/String;

    return-object v0
.end method
