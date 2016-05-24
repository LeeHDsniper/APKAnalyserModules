.class public final Lcom/google/android/gms/signin/zze;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/android/gms/common/api/Api$ApiOptions$Optional;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/signin/zze$1;,
        Lcom/google/android/gms/signin/zze$zza;
    }
.end annotation


# static fields
.field public static final zzaOd:Lcom/google/android/gms/signin/zze;


# instance fields
.field private final zzRU:Ljava/lang/String;

.field private final zzaOe:Z

.field private final zzaOf:Z

.field private final zzaOg:Lcom/google/android/gms/common/api/GoogleApiClient$ServerAuthCodeCallbacks;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/google/android/gms/signin/zze$zza;

    invoke-direct {v0}, Lcom/google/android/gms/signin/zze$zza;-><init>()V

    invoke-virtual {v0}, Lcom/google/android/gms/signin/zze$zza;->zzzr()Lcom/google/android/gms/signin/zze;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/signin/zze;->zzaOd:Lcom/google/android/gms/signin/zze;

    return-void
.end method

.method private constructor <init>(ZZLjava/lang/String;Lcom/google/android/gms/common/api/GoogleApiClient$ServerAuthCodeCallbacks;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/google/android/gms/signin/zze;->zzaOe:Z

    iput-boolean p2, p0, Lcom/google/android/gms/signin/zze;->zzaOf:Z

    iput-object p3, p0, Lcom/google/android/gms/signin/zze;->zzRU:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/android/gms/signin/zze;->zzaOg:Lcom/google/android/gms/common/api/GoogleApiClient$ServerAuthCodeCallbacks;

    return-void
.end method

.method synthetic constructor <init>(ZZLjava/lang/String;Lcom/google/android/gms/common/api/GoogleApiClient$ServerAuthCodeCallbacks;Lcom/google/android/gms/signin/zze$1;)V
    .registers 6

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/gms/signin/zze;-><init>(ZZLjava/lang/String;Lcom/google/android/gms/common/api/GoogleApiClient$ServerAuthCodeCallbacks;)V

    return-void
.end method


# virtual methods
.method public zzlG()Ljava/lang/String;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/signin/zze;->zzRU:Ljava/lang/String;

    return-object v0
.end method

.method public zzzo()Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/signin/zze;->zzaOe:Z

    return v0
.end method

.method public zzzp()Z
    .registers 2

    iget-boolean v0, p0, Lcom/google/android/gms/signin/zze;->zzaOf:Z

    return v0
.end method

.method public zzzq()Lcom/google/android/gms/common/api/GoogleApiClient$ServerAuthCodeCallbacks;
    .registers 2

    iget-object v0, p0, Lcom/google/android/gms/signin/zze;->zzaOg:Lcom/google/android/gms/common/api/GoogleApiClient$ServerAuthCodeCallbacks;

    return-object v0
.end method
